class ShoppingCartsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    # Get the products in the shopping cart
    product_types = helpers.shopping_cart_get_products()
    @required_products = {}

    product_types.each do |k,v|
      tt = ProductType.find(k)
      @required_products[tt] = v
    end

    @total = helpers.shopping_cart_total()
  end

  def update
    begin
      amount = params[:amount].to_i
      product_type = params[:product_type_id]

      if amount < 0
        render status: 500
      end

      amount_in_cart = session[:shopping_cart].count(product_type)

      if amount < amount_in_cart # Should products be removed
        delta = amount_in_cart - amount
        delta.times do |i|
          session[:shopping_cart].delete_at(session[:shopping_cart].index(product_type))
        end
      elsif amount > amount_in_cart # Should more products be added
        delta = amount - amount_in_cart
        delta.times do |i|
          session[:shopping_cart] << product_type
        end
      end

      respond_to do |f|
        response = { status: "ok", message: "Success", cart: session[:shopping_cart],
                     total: helpers.shopping_cart_total(),
                     html: "(" + session[:shopping_cart].length.to_s() + ")" }
        f.json { render json: response, status: :created, location: "/" }
      end
    rescue RuntimeError => e
      respond_to do |f|
        f.json { render json: { :status => "Failure" }, status: :unprocessable_entity }
      end
    end
  end

  def add_product

    # Set the shopping cart if unset
    session[:shopping_cart] ||= []

    begin
      product_type = ProductType.find(shopping_cart_params[:product_type_id])
    rescue
      redirect_back fallback_location: root_path, flash: { error: "Invalid event or product type!" } and return
    end

    shopping_cart_params[:amount].to_i.times {
      session[:shopping_cart] << shopping_cart_params[:product_type_id]
    }

    redirect_back fallback_location: root_path, flash: { notice: "Product added to shopping cart!" } and return

    #render plain: "success! " + session[:shopping_cart].inspect
  end

  private

  def shopping_cart_params
    params.permit(:utf8, :_method, :authenticity_token, :commit, :id, :product_type_id, :amount)
  end
end