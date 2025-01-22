class OpinionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lego, only: [ :create ]
  before_action :set_opinion, only: [ :update, :destroy ]
  before_action :set_lego_and_opinion, only: [ :edit, :update, :destroy ]

  def create
    @lego = Lego.find(params[:lego_id])
    @opinion = Opinion.new(
      user: current_user,
      lego: @lego,
      rating: params[:rating],
      comment: params[:comment]
    )
    @opinion.user = current_user

    if @opinion.save
      redirect_to lego_path(@lego)
    else
      redirect_to lego_path(@lego)
    end
  end

  def edit
  end

  def update
    if @opinion.update(opinion_params)
      redirect_to lego_path(@lego)
    else
      render :edit
    end
  end

  def destroy
    @opinion.destroy
    redirect_to lego_path(@lego)
  end

  private

  def set_lego_and_opinion
    @lego = Lego.find(params[:lego_id])
    @opinion = @lego.opinions.find(params[:id])
  end

  def set_lego
    @lego = Lego.find(params[:lego_id])
  end

  def set_opinion
    @opinion = current_user.opinions.find(params[:id])
  end

  def opinion_params
    params.require(:opinion).permit(:rating, :comment)
  end
end
