class Query < ApplicationRecord
  validates :input, presence: true
  enum language: %i[ruby python javascript].freeze

  def autocomplete_results
    return @results if @results

    @results = []
    return @results unless input.length.to_i >= 3

    input.length.times do |n|
      @results << [n, input]
    end
    @results
  end
end
