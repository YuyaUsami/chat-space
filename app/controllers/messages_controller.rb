class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(comment_params)
    if @message.save
      flash[:success] = '作成に成功しました。'
      redirect_to group_messages_path(@group)
    else
      flash[:false] = '作成に失敗しました。'
      render 'index'
    end
  end

  private
  def comment_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
