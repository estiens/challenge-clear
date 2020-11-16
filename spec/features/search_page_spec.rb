require "rails_helper"

RSpec.describe "Home Page", type: :feature do
  before do
    Capybara.add_selector(:dt) do
      css { |v| "*[data-test=#{v}]" }
    end

    Rails.cache.clear
  end

  it "it exists", js: true do
    visit root_path
    expect(page).to have_text("Search For A Library")
  end

  it "it searches", js: true do
    visit root_path

    count = Query.count

    page.fill_in "search-input", with: "clean"
    expect(page.find("#results-list")).to have_text("10 ruby results")

    expect(Query.count).to eq count + 1
    expect(Query.last.input).to eq "clean"
  end

  it "it can search for a different language", js: true do
    visit root_path

    count = Query.count

    find("#python-checkbox").set(true)
    fill_in "search-input", with: "clear"
    expect(page.find("#results-list")).to have_text("0 python results")

    expect(Query.count).to eq count + 1
    expect(Query.last.python?).to eq true
    expect(Query.last.input).to eq "clear"
  end

  it "it shows data", js: true do
    visit root_path

    page.fill_in "search-input", with: "clean"
    expect(page.find("#results-list")).to have_text("10 ruby results")

    search_result = find(:dt, "search-result", match: :first)
    library_name = search_result.text

    search_result.click

    expect(find(:dt, "show-info").text).to include library_name
  end
end
