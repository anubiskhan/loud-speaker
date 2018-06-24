class CartController < ApplicationController
  def show
    @coin_presenter = CoinPricePresenter.new
    @products = Product.where(id: @cart.contents.keys)
    @current_map = current_map
    @current_map.create_static
  end

  def create
    product = Product.find(params[:product_id])

    @cart.add_product(product.id)
    session[:cart] = @cart.contents
    redirect_to cart_path
  end
end
