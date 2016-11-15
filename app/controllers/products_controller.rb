class ProductsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @products = Product.order(created_at: :desc)
  end


  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    @product.user = current_user
    # byebug
    if @product.save
      flash[:notice] = 'Product Created!'
      redirect_to product_path(@product)
    else
      flash.now[:alert] = 'Please see errors below'
      render :new
    end
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @favorite = @product.favorite_for(current_user)
  end


  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    if @product.update product_params
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
  end


  def product_params
    params.require(:product).permit([:title, :description, :price, :category_id])
  end


end


