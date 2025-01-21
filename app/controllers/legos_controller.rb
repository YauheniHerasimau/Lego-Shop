class LegosController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :require_admin, only: [ :new, :create, :edit, :update, :destroy, :toggle_hidden ]
  before_action :set_lego, only: [ :show, :edit, :update, :destroy, :toggle_hidden ]
  def index
    @legos = if current_user&.admin?
      case params[:admin_filter]
      when "hidden"
        Lego.where(hidden: true)
      when "visible"
        Lego.where(hidden: false)
      when "new"
        redirect_to new_lego_path and return
      else
        Lego.all
      end
    else
      Lego.where(hidden: false)
    end

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

  def edit
  end

  def update
    if @lego.update(lego_params)
      redirect_to @lego
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle_hidden
    @lego.update(hidden: !@lego.hidden?)
    redirect_to lego_path
  end

  private

  def set_lego
    @lego = Lego.find(params[:id])
  end

  def require_admin
    unless current_user&.admin?
      redirect_to root_path
    end
  end

  def lego_params
    params.require(:lego).permit(:name, :description, :lego_set, :details, :image_url, :price, :hidden)
  end
end
