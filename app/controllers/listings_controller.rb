class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.reorder("created_at DESC").page(params[:page]).per_page(5)
  end

  def new
    @listing = Listing.new

  end

  def edit
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      flash[:success] = "Listing was successfully created"
      redirect_to listing_path(@listing)
    else
      render 'new'
    end
  end

  def show

  end

  def destroy

    @listing.destroy
    flash[:danger] = "Listing was successfully deleted"
    redirect_to listings_path
  end

  def update

    if @listing.update(listing_params)
      flash[:success] = "Listing updated succcessfully"
      redirect_to listing_path(@listing)
    else
      render 'edit'
    end
  end

  private
    def listing_params
      params.require(:listing).permit(:title,
                                      :tag_line,
                                      :description,
                                      :twitter_url,
                                      :facebook_url,
                                      :linkedin_url,
                                      :instagram_url,
                                      :snapchat_url,
                                      :youtube_url,
                                      :angellist_url,
                                      :medium_url,
                                      :producthunt_url,
                                      :reddit_url,
                                      :twitch_url,
                                      :companions,
                                      :price,
                                      :price_time,
                                      :start_date,
                                      :end_date,
                                      :city,
                                      category_ids: [],
                                      interest_ids: [])
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def require_same_user
      if current_user != @listing.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own listing"
        redirect_to root_path
      end
    end

end
