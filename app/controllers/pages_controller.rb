class PagesController < ApplicationController

  def index
    # redirect_to listings_path if logged_in?
    @categories = Category.paginate(page: params[:page], per_page: 12)
  end

  def about
  end

end
