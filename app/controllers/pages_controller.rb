class PagesController < ApplicationController
  def home
  end

  def courses
  end
  
  def about
    @page_title = "About LAschool"
  end
end
