class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
  end

  def index
    @messages = Message.all
  end

  private
  def message_params
    params.require(:message).permit(:title, :content)
  end

end
