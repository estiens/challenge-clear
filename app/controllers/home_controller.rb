class HomeController < ApplicationController
  include ApplicationHelper

  def index
    @query ||= nil
    @result ||= nil
  end

  def load_test
    lang = rand(10) < 7 ? "ruby" : "javascript"
    @query = Query.create!(input: common_library_word, language: lang, ip_address: request.remote_ip)
    @result ||= nil
    render :index
  end

  def stats
    @recent_queries = Query.last(7).reverse
  end

  def common_queries
    queries = Query.group(:input).count.sort_by { |_k, v| v }.last(10).reverse
    render json: queries
  end

  def language_count
    render json: Query.group(:language).count
  end

  private
    def common_library_word
      %w[rails
         api
         ruby
         client
         active
         gem
         simple
         view
         javascript
         tool
         hola
         test
         acts
         parser
         string
         spree
         generator
         data
         json
         record
         model
         vote
         cache
         admin
         cli
         time
         hash
         helper
         search
         with
         game
         auth
         validator
         file
         mongoid
         palindrome
         logger
         has].sample
    end
end
