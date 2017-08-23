class GroupsController < ApplicationController
  before_action :require_user, except: [:index, :show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      flash[:success] = "Group was created succesfully"
      redirect_to groups_path(@group)
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:success] = "Group was updated succcessfully"
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end

  def show
    @group = Group.find(params[:id])
    @person_groups = @group.people.paginate(page: params[:page], per_page: 4)
  end



  private
  def group_params
    params.require(:group).permit(:title, :description, category_ids: [], person_ids: [])
  end

  def set_person
    @group = Group.find(params[:id])
  end

end
