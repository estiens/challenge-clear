module JsApi
  class Record
    def initialize(record)
      @record = record.is_a?(Array) ? record.first : record
    end

    def language
      :javascript
    end

    def persisted?
      false
    end

    def library_name
      @record.dig("package", "name")
    end

    def version_infos
      [
        { number: @record.dig("package", "version"),
          required_version: nil,
          updated_at: @record.dig("package", "date") }
      ]
    end

    def library_description
      "JS description here"
    end

    def authors
      @record.dig("package", "maintainers")&.map { |n| n["username"] }&.join(", ")
    end

    def url
      @record.dig("package", "links", "npm")
    end
  end
end
