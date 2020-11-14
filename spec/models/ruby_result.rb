require "rails_helper"

RSpec.describe "RubygemsDatabase::Record", type: :model do
  it "has a scope for querying by name" do
    records = RubygemsDatabase::Record.query_by_name("clean")
    expect(records.count).to eq 16

    records = RubygemsDatabase::Record.query_by_name("dirty")
    expect(records.count).to eq 10
  end

  it "has a name" do
    records = RubygemsDatabase::Record.query_by_name("clean")
    record = records.first

    expect(record.library_name).to eq "jekyll-theme-clean-blog"
  end
end
