class HomeController < ApplicationController
  layout "home_page"
  
  def index
    @events = Event.all
  end
end
