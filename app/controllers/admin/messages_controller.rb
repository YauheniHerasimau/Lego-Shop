class Admin::MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.includes(:user).all
  end

  def mark_as_read
    @message = Message.find(params[:id])
    @message.update(admin_read: true)
    redirect_to admin_messages_path
  end
end
