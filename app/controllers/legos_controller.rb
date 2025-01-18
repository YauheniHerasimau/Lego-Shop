class LegosController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :require_admin, only: [ :new, :create, :destroy ]
  def index
    @legos = Lego.all

    @legos = case params[:order_by]
    when "all"
      @legos.all
    when "newest"
      @legos.order(created_at: :desc)
    when "price"
      @legos.order(price: :asc)
    when "name"
      @legos.order(name: :asc)
    else
      @legos
    end
  end

  def new
    @lego = Lego.new
  end

  def show
    @lego = Lego.find(params[:id])
    @opinion = Opinion.new(lego: @lego)
  end

  def create
    @lego = Lego.new(lego_params)
    if @lego.save
      redirect_to root_path
    else
      render :new
    end
  end


  def destroy
    @lego = Lego.find(params[:id])
    @lego.destroy
    redirect_to root_path
  end

  private

  def require_admin
    unless current_user&.admin?
      redirect_to root_path
    end
  end

  def lego_params
    params.require(:lego).permit(:name, :description, :lego_set, :details, :image_url, :price)
  end
end
