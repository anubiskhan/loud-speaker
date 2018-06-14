class CartController < ApplicationController
  def show
    @coin_presenter = CoinPricePresenter.new
  end
end
