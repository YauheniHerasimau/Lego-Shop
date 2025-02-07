class MessagesController < ApplicationController
  def index
    @messages = current_user.messages.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = current_user.messages.build(params.require(:message).permit(:content))
    
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end
end
