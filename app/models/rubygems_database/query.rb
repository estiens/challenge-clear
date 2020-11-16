module RubygemsDatabase
  class Query
    def initialize(query:, limit: 10)
      @query = query
      @limit = limit
    end

    def autocomplete_results
      Record.query_by_name(@query).limit(@limit).pluck(:id, :name)
    end

    def record_for(id)
      Record.find(id)
    end
  end
end
