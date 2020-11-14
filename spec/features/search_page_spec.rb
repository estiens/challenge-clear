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

    page.fill_in "search-input", with: "awesome"
    expect(page.find("#results-list")).to have_text("7 ruby results found")
  end
end
