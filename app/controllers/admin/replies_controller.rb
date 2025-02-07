class Admin::RepliesController < ApplicationController
    before_action :set_message
  
    def new
      @reply = @message.build_reply
    end
  
    def create
      @reply = @message.build_reply(reply_params)
      @reply.admin = current_user
      #binding.irb
      if @reply.save
        redirect_to admin_messages_path
      else
        render :new
      end
    end
  
    private
  
    def set_message
      @message = Message.find(params[:message_id])
    end
  
    def reply_params
      params.require(:reply).permit(:content)
    end
  end
  