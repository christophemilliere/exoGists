require "gists/gists_books"
class PageController < ApplicationController
  include Gists
  def home
    if company_signed_in?
      puts "true"
      redirect_to :controller =>"gists", :action =>"add_gists"
    end
  end
end
