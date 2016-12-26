class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(create_params)
    if @group.save
      flash[:success] = '作成に成功しました。'
      redirect_to controller: 'messages' , action: 'index'
    else
      flash[:false] = '作成に失敗しました。'
      render 'new'
    end
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end

end
