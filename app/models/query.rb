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
    Rails.cache.fetch("autocomplete_#{cache_key}") do
      return [] unless input.length.to_i >= 3

      query.autocomplete_results
    end
  end

  def record_for(name)
    Rails.cache.fetch("record_#{cache_key}") do
      query.record_for(name)
    end
  end

  private
    def cache_key
      "query_#{input}_#{language}"
    end
end
