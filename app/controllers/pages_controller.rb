class PagesController < ApplicationController
  def home
    @headline = "Welcome to Alpha Blog"
    @content = "Here, 
              we provide valuable insights and resources for developers
              of all levels. Our experienced team shares their knowledge
              on a wide range of topics, from coding languages to 
              software architecture. We strive to create high-quality 
              content that is both informative and engaging."

    redirect_to articles_path if logged_in?
  end

  def about
    @headline = "About Alpha Blog"
    @content = "We're a team of writers, editors, and content creators 
                who are passionate about sharing our thoughts, insights, and expertise
                with the world. Our blog covers a wide range of topics, 
                including personal development, business, and technology."

    @sub_content = "Our goal is to provide our readers with valuable and useful 
                information that they can apply to their own lives. We believe that knowledge 
                is power, and we strive to empower our readers through the content we create."
  end
end
