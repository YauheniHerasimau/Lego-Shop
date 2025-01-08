class LegosController < ApplicationController
  def index
    @legos = Legos.all
  end

  def show
    @lego = Legos.find(params[:id])
  end

  def new
    @lego = Legos.new
  end

  private

  def lego_params
    params.require(:lego).permit(:name, :description, :lego_set, :image_url, :details, :price)
  end
end
