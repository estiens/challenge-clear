class Query < ApplicationRecord
  validates :input, presence: true
  enum language: %i[ruby python javascript].freeze

  def record_library
    if ruby?
      "RubygemsDatabase::Query".constantize
    elsif javascript?
      "JsApi::Query".constantize
    end
  end

  def query
    return nil unless record_library

    @query ||= record_library.new(query: input)
  end

  def autocomplete_results
    return [] unless input.length.to_i >= 3

    query.autocomplete_results
  end

  delegate :record_for, to: :query
end
