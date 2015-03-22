class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Нову групу створено.'
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.permit(:name, :number, :manager)
  end

end
