class ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_admin
  before_action :set_opinion

  def new
    @response = @opinion.build_admin_response
  end

  def create
    @response = @opinion.build_admin_response(response_params)
    @response.admin = current_user

    if @response.save
      redirect_to lego_path(@opinion.lego)
    else
      render :new
    end
  end

  def edit
    @response = @opinion.admin_response

    if @response.nil?
      redirect_to lego_path(@opinion.lego)
    end
  end

  def update
    @response = @opinion.admin_response

    if @response.update(response_params)
      redirect_to lego_path(@opinion.lego)
    else
      render :edit
    end
  end

  def destroy
    @response = @opinion.admin_response

    if @response.destroy
      redirect_to lego_path(@opinion.lego)
    end
  end

  def delete
  end


  private

  def set_opinion
    @opinion = Opinion.find(params[:opinion_id])
  end

  def response_params
    params.require(:admin_response).permit(:comment)
  end

  def ensure_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
