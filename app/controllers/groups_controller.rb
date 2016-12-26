class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(create_params)
    if @group.save
      redirect_to controller: 'messages' , action: 'index'
    else
      flash[:false] = '作成に失敗しました。'
      redirect_to controller: 'groups' ,action: 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end

end
