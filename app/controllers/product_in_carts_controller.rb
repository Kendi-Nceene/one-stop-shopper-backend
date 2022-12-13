class ProductInCartsController < ApplicationController

    before_action :authorize
    def index
        user = User.find_by(id: session[:user_id])
        product_in_carts= user.product_in_carts
        render json: product_in_carts
    end
    
    def create
        user = User.find_by(id: session[:user_id])
        product_in_carts= user.product_in_carts.create(product_params)
        if product_in_carts.valid?
            render json: product_in_carts, status: :created
        else
            render json: {errors: product_in_carts.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
    def destroy
        product_in_cart = ProductInCart.find_by(id: params[:id])
        if product_in_cart
          product_in_cart.destroy
          head :no_content
        else
          render json: { error: "Product not found" }, status: :not_found
        end
    end

private
    def product_params
        params.permit(:user_id, :product_id)
    end

    def authorize
        return render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
      end


end
