class LegosController < ApplicationController
  def index
    @legos = Legos.all

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

  def show
    @lego = Legos.find(params[:id])
  end

  def new
    @lego = Legos.new(lego_params)

    if @lego.save
      respond_to do |format|
        format.html { redirect_to legos_path }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @lego = Legos.new(lego_params)

    respond_to do |format|
      if @lego.save
        format.html { redirect_to legos_path }
        format.json { render :show, ststus: :created, location: @lego }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lego.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @lego = Legos.find(params[:id])
    @lego.destroy
    respond_to do |format|
      format.html { redirect_to legos_path }
      format.turbo_stream
    end
  end

  private

  def lego_params
    params.permit(:name, :description, :lego_set, :details, :image_url, :price)
  end
end
