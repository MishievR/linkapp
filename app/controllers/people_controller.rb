class PeopleController < ApplicationController
  before_action :set_person, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:destroy]

  def index
    @people = Person.reorder("created_at DESC").page(params[:page]).per_page(25)
  end

  def new
    @person = Person.new

  end

  def edit
  end

  def create
    @person = Person.new(person_params)
    @person.user = current_user
    if @person.save
      flash[:success] = "Listing was successfully created"
      redirect_to person_path(@person)
    else
      render 'new'
    end
  end

  def show

  end

  def destroy
    @person.destroy
    flash[:danger] = "Listing was successfully deleted"
    redirect_to people_path
  end

  def update
    if @person.update(person_params)
      flash[:success] = "Listing updated succcessfully"
      redirect_to person_path(@person)
    else
      render 'edit'
    end
  end

  def upvote
    @person = Person.find(params[:id])
    @person.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @person = Person.find(params[:id])
    @person.downvote_by current_user
    redirect_to :back
  end

  private
    def person_params
      params.require(:person).permit(:title,
                                      :tag_line,
                                      :description,
                                      :profile_image_url,
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
                                      user_ids: [],
                                      category_ids: [],
                                      interest_ids: [],
                                      group_ids: [])
    end

    def set_person
      @person = Person.find(params[:id])
    end

    def require_same_user
      if current_user != @person.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own OverLink"
        redirect_to root_path
      end
    end

end
