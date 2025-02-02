module Admin
  class MessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin

    def index
      @messages = Message.all.includes(:user).order(created_at: :desc)
    end

    private

    def check_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end
  end
end
