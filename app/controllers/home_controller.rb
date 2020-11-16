class HomeController < ApplicationController
  include ApplicationHelper

  def index
    @query ||= nil
    @result ||= nil
  end
end
