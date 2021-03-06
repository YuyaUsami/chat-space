class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group) }
        format.json { render json: { name: @group.name } }
      end
      flash[:success] = '作成に成功しました。'
    else
      flash[:false] = '作成に失敗しました。'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      flash[:success] = '編集に成功しました。'
      redirect_to group_messages_path(@group)
    else
      flash[:false] = '編集に失敗しました。'
      render 'edit'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,{ :user_ids => [] })
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
