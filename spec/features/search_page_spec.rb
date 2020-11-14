require "rails_helper"

RSpec.describe "Home Page", type: :feature do
  before do
    Rails.cache.clear
  end

  it "it exists", js: true do
    visit root_path
    expect(page).to have_text("Search For A Library")
  end

  it "it searches", js: true do
    visit root_path

    count = Query.count

    page.fill_in "search-input", with: "awesome"
    expect(page.find("#results-list")).to have_text("7 ruby results")

    expect(Query.count).to eq count + 1
    expect(Query.last.input).to eq "awesome"
  end

  it "it can search for a different language", js: true do
    visit root_path

    count = Query.count

    find("#python-checkbox").set(true)
    fill_in "search-input", with: "more"
    expect(page.find("#results-list")).to have_text("4 python results")

    expect(Query.count).to eq count + 1
    expect(Query.last.python?).to eq true
    expect(Query.last.input).to eq "more"
  end
end
