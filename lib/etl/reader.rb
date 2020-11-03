# You can access the database once you've used load pg data like this
ActiveRecord::Base.connected_to(database: :rubygems) do
  puts "List of tables from RubyGems data dump."
  puts ActiveRecord::Base.connection.tables.inspect
  sql = <<~SQL
    SELECT * FROM rubygems LIMIT 1
  SQL
  puts "One record show should up here!"
  records_array = ActiveRecord::Base.connection.exec_query(sql)
  puts records_array.first
end

# You can reconnect to the rails application db like so
ActiveRecord::Base.connected_to(database: :primary) do
  puts "The application tables should show up below."
  puts ActiveRecord::Base.connection.tables.inspect
end
