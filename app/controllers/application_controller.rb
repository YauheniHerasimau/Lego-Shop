class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def insure_cart_exist
    if current_user.cart.nil? && user_signed_in?
      current_user.create_cart
    end
  end
end
