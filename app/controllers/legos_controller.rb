class LegosController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :require_admin, only: [ :new, :create, :edit, :update, :destroy, :toggle_hidden ]
  before_action :set_lego, only: [ :show, :edit, :update, :destroy, :toggle_hidden ]

  def index
    @categories = Category.all

    @legos = if params[:category_id].present?
      Lego.joins(:categories).where(categories: { id: params[:category_id] }).distinct
    else
      Lego.all
    end

    @legos = if user_signed_in? && current_user.admin?
      @legos
    else
      @legos.where(hidden: false)
    end

    @legos = case params[:show_hidden]
    when "true"
      @legos.where(hidden: true)
    when "false"
      @legos.where(hidden: false)
    else
      @legos
    end

    @legos = case params[:order_by]
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
    @categories = Category.all
  end

  def show
    @lego = Lego.find(params[:id])
    @opinion = Opinion.find_by(id: params[:opinion_id])
    @response = @opinion&.admin_response if @opinion
  end

  def create
    @lego = Lego.new(lego_params)
    if @lego.save
      redirect_to root_path
    else
      @categories = Category.all
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
    params.require(:lego).permit(:name, :description, :lego_set, :details, :image_url, :price, :hidden, category_ids: [])
  end
end
