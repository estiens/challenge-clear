# db/seeds.rb
case Rails.env
when "development"
  # dev seeds
when "test"
  require Rails.root.join("db", "seeds", "test", "rubygem.rb")
when "production"
  # prod seeds
end
