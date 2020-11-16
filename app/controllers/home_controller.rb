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
         as
         tool
         hola
         test
         to
         acts
         parser
         string
         spree
         generator
         data
         json
         my
         record
         model
         voteable
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
