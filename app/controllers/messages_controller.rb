class MessagesController < ApplicationController
  def index
    flash[:success] = '作成に成功しました。'
  end
end
