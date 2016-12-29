class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.order("created_at DESC")
  end

  def create
    Message.create(comment_params)
    redirect_to message_path
  end

  private
  def comment_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end
end
