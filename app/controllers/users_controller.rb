module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
      @users = User.includes(:opinions).all
    end

    def show
      @user = User.find(params[:id])
    end

    def ban
      @user = User.find(params[:id])
      @user.update(banned: true)
      redirect_to admin_users_path
    end

    def unban
      @user = User.find(params[:id])
      @user.update(banned: false)
      redirect_to admin_users_path
    end

    private

    def autentificate_user!
      unless current_user.admin?
        redirect_to root_path
      end
    end
  end
end
