class HomeController < ApplicationController
  def index
    @query ||= nil
    @result ||= nil
  end
end
