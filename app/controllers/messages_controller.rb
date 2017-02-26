class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id])
    @groups = current_user.groups
  end

  def create
    @message = Message.new(create_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group) }
        format.json { render json: { name: @message.user.name, time: @message.created_at.strftime('%Y/%m/%d %H:%M:%S'), body: @message.body, image: @message.image } }
      end
      flash[:success] = '作成に成功しました。'
    else
      flash[:false] = '作成に失敗しました。'
      render 'index'
    end
  end

  private
  def create_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
