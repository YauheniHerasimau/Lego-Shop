class LegosController < ApplicationController
  def index
    @legos = Legos.all

    @legos = case params[:order_by]
    when "all"
      @legos.all
    when "newest"
      @legos.order(created_at: :asc)
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
    @lego = Legos.new
  end

  def sort_by_price
    @legos = Legos.order(price: :asc)
  end

  private

  def lego_params
    params.require(:lego).permit(:name, :description, :lego_set, :image_url, :details, :price)
  end
end
