class User < ApplicationRecord
  has_one :cart
  after_create :create_cart
  has_many :opinions

private

def has_opinion?
  @lego = Lego.find(params[:lego_id])
  @opinion = @lego.opinions.find_by(user: current_user)
  @opinion.present?
end

def create_cart
  Cart.create(user: self)
end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
