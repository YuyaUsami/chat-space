class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    binding.pry
    @group = Group.create(group_params)
    if @group.save
      flash[:success] = '作成に成功しました。'
      redirect_to controller: 'messages' , action: 'index'
    else
      flash[:false] = '作成に失敗しました。'
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    flash[:success] = '編集に成功しました。'
    redirect_to controller: 'messages' , action: 'index'
  end

  private
  def group_params
    params.require(:group).permit(:name,{ :user_ids => [] })
  end

end
