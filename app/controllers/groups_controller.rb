class GroupsController < ApplicationController
  before_action :prepare_group, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = '作成に成功しました。'
      redirect_to controller: 'messages' , action: 'index'
    else
      flash[:false] = '作成に失敗しました。'
      render 'new'
    end
  end

  def edit
  end

  def update
    @group.update(group_params)
    if @group.save
      flash[:success] = '編集に成功しました。'
      redirect_to controller: 'messages' , action: 'index'
    else
      flash[:false] = '編集に失敗しました。'
      render 'edit'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,{ :user_ids => [] })
  end

  def prepare_group
    @group = Group.find(params[:id])
  end

end
