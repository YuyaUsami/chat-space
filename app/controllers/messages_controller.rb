class MessagesController < ApplicationController
  def index
    flash.now[:success] = '作成に成功しました。'
  end
end
