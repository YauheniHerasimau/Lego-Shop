class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = current_user.messages
  end

  def new
    @message = current_user.messages.build
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
