namespace :rubygems do
  task :download do
    download_file = Rails.root.join("tmp", "rubygems.sql.gz")
    base_url = "https://s3-us-west-2.amazonaws.com/rubygems-dumps/"
    prefix = "production/public_postgresql"
    latest_version = "2020.11.13.13.10.11"
    filename = "public_postgresql.tar"

    `curl --progress-bar #{base_url}#{prefix}/#{latest_version}/#{filename} --output #{download_file}`
  end

  task :load do
    rubygems_database = :rubygems
    config = Rails.configuration.database_configuration.dig("development", rubygems_database.to_s)
    host = config["host"]
    database = config["database"]
    username = config["username"]
    password = config["password"]

    psql_config_string = "-q #{host}"
    psql_config_string += "-U #{username}" if username
    psql_config_string += "-P #{password}" if password
    psql_config_string += "-d #{database}"

    sh("psql #{psql_config_string} -c 'CREATE EXTENSION IF NOT EXISTS hstore;'")
    sh("psql #{psql_config_string} -c 'DROP TABLE IF EXISTS dependencies, gem_downloads, linksets, rubygems, versions CASCADE;'")
    sh("tar xOf #{Rails.root.join('tmp', 'rubygems.sql.gz')} | gunzip -c | psql #{psql_config_string}")
  end

  task create_test_seeds: :environment do
    clean_ids = RubygemsDatabase::Record.query_by_name("clean").limit(15).pluck(:id)
    dirty_ids = RubygemsDatabase::Record.query_by_name("dirty").limit(10).pluck(:id)
    ids = clean_ids + dirty_ids
    SeedDump.dump(RubygemsDatabase::Record.find(ids), file: Rails.root.join("db", "seeds", "test", "rubygem.rb"))
    SeedDump.dump(RubygemsDatabase::Detail.where(rubygem_id: ids), file: Rails.root.join("db", "seeds", "test", "rubygem.rb"), append: true)
    SeedDump.dump(RubygemsDatabase::GemDownload.where(rubygem_id: ids), file: Rails.root.join("db", "seeds", "test", "rubygem.rb"), append: true)
    SeedDump.dump(RubygemsDatabase::Version.where(rubygem_id: ids), file: Rails.root.join("db", "seeds", "test", "rubygem.rb"), append: true)
  end
end
