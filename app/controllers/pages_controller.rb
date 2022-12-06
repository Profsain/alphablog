class PagesController < ApplicationController
  def home
  end

  def about
    @headline = "About Alpha Blog"
    @content = "This is the about page for the Alpha Blog application."
  end
end
