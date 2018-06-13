class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.new(product_params)
    redirect_to product_path(@product) if @product.save
  end

  def create
    @product = Product.new(product_params)
    return redirect_to "/products" if @product.save
  end

  private

  def product_params
    params.require(:product).permit(:title, :description)
  end
end
