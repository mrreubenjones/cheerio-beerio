class ReviewsController < ApplicationController

  def create
    @product = Product.find params[:product_id]
    @user = User.find(session[:user_id])
    review_params = params.require(:review).permit(:star_count, :body)
    @review = Review.new review_params
    @review.product = @product
    @review.user = @user
    if @review.save
      redirect_to product_path(@product), notice: 'Review added.'
    else
      render 'products/show'
    end
  end

  def destroy
    product = Product.find params[:product_id]
    review = Review.find params[:id]
    review.destroy
    redirect_to product_path(product), notice: 'Deleted!'
  end



end
