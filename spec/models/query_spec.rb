require "rails_helper"

RSpec.describe Query, type: :model do
  let(:query) { Query.create(input: "awesomesauce!") }

  it "is invalid without an input" do
    query.input = nil
    expect(query.valid?).to eq false
    expect(query.errors.messages.keys).to include :input
  end

  it "#autocomplete_results returns array" do
    expect(query.autocomplete_results).to be_a_kind_of Array
  end
end
