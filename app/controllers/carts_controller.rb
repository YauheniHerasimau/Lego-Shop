class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
    @cart = current_user.cart || current_user.create_cart!
  end

  def add_item
    @cart_item = @cart.cart_items.find_or_initialize_by(lego_id: params[:lego_id])
    @cart_item.quantity ||= 0
    @cart_item.quantity += 1

    if @cart_item.save
      redirect_to @cart, notice: "Item added to cart."
    end
  end

  def remove_item
    cart_item = @cart.cart_items.find(params[:item_id])
    cart_item.destroy
    redirect_to cart_path
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart!
  end
end
