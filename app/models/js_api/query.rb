module JsApi
  class Query
    def initialize(query:, limit: 10)
      @query = query
      @limit = limit
    end

    def autocomplete_results
      records_for_query.map do |r|
        name = package_name(r)
        next unless name
        next if name == "not-defined"

        [name, name]
      end.compact
    end

    def record_for(name)
      return JsApi::Record.none unless name

      record = records_for_query&.select { |r| package_name(r) == name }
      record.present? ? JsApi::Record.new(record) : JsApi::Record.none
    end

    private
      def package_name(result)
        return nil unless result.is_a? Hash

        result.dig("package", "name")
      end

      def records_for_query
        @records_for_query ||= Base.api_search(query: @query, limit: @limit)
      end
  end
end
