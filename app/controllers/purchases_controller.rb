class PurchasesController < ApplicationController
  def show
    @purchase = Purchase.find(params[:id])
    @map = Map.find(@purchase.purchase_products[0].map_id)
  end

  def create
    quantity = @cart.contents.values[0]
    product_id = @cart.contents.keys[0]
    price = Product.find(product_id).price
    @purchase = Purchase.new(
      user_id: current_user.id
    )
    charge_error = nil
    begin
      customer = Stripe::Customer.create(
        :email => 'example@stripe.com',
        :card  => params[:stripeToken])

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => (params[:cost].to_f * 100).floor,
        :description => 'Rails Stripe customer',
        :currency    => 'usd')

    rescue Stripe::CardError => e
      charge_error = e.message
    end
    if charge_error
      flash[:error] = charge_error
      render :new
    else
      @current_map.create_static
      @current_map.save
      @purchase.save
      PurchaseProduct.create(
        quantity: quantity,
        sale_price: price,
        map_id: @current_map.id,
        purchase_id: @purchase.id,
        product_id: product_id
      )
      session.delete(:cart)
      redirect_to purchase_path(@purchase)
    end
  end

end
