class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    Group.create(create_params)
    redirect_to controller: :messages , action: :index
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end

  def confirm
    p post_parms
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end

  def post_parms
    params.require(:groups_controller_post).permit(persons: [])
  end
end
