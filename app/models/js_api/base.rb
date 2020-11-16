module JsApi
  require "uri"
  require "net/http"
  require "json"

  class Base
    API_URL = "https://api.npms.io/v2".freeze

    def self.search_url
      "#{API_URL}/search"
    end

    def self.record_url(name)
      "#{API_URL}/package/#{name}"
    end

    def self.api_request(url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(url)
      http.request(request)
    end

    def self.fetch_record(blob)
      # okay the API is not working for indiv pavkags so well work around it
    end

    def self.api_search(query:, limit: 10)
      url = URI(search_url + "?q=#{query}")
      response = api_request(url)
      return [] unless response.code == "200"

      results = JSON.parse(response.body)&.dig("results")
      results.first(10)
    end
  end
end
