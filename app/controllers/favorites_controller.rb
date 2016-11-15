class FavoritesController < ApplicationController
  before_action :authenticate_user

  def index
    @favorites = Favorite.where(user: current_user).order(created_at: :desc)
    # @rating = Review.find_by()
  end

  def create
    product = Product.find params[:product_id]
    favorite = Favorite.new(user: current_user, product: product)

    if favorite.save
      redirect_to :back, notice: "Added to your favorites list :)"
    else
      redirect_to :back, alert: favorite.errors.full_messages.join(", ")
    end
  end

  def destroy
    favorite = Favorite.find params[:id]
    # product = favorite.product

    if favorite.destroy
      redirect_to :back, notice: "😭"
    else
      redirect_to :back, alert: favorite.errors.full_messages.join(", ")
    end
  end

end
