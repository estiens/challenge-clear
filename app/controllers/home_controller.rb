class HomeController < ApplicationController
  def index
    @query ||= nil
    @language ||= nil
    @results ||= []
  end

  def show; end
end
