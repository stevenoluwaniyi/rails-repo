module Api
	module V1
		class OrdersController < ApplicationController
			def index
				orders = Order.order('channel DESC');
				render json: orders, status: :OK
			end

			def show
				begin
				orders = Order.find(params[:id]);
				render json: orders, status: :OK
			rescue => e
				render status: :not_found
			end
			end	
			#Creates a new order and confirm if the order has been successfully created
			def create
				orders = Order.new(order_params);
				if orders.save
					render json: orders, status: :created
				else
					render json: orders.errors, status: :not_acceptable

				end
			end
			#Method to delete an order. Find the parameter ID and delete the order
			def destroy
				begin
				orders = Order.find(params[:id]);
				orders.destroy
				render json: orders, status: :no_content
			rescue => e
				render status: :not_found
			end
			end

			#Get the ID of the order and update the neccessary attributes
			def update
				orders = Order.find(params[:id]);
				if orders.update_attributes(order_params)
					render json: orders, status: :OK
				else
					render json: orders.errors, status: :not_found
				end	
			end

				


			private

			#Define a private parameter that will accept the needed values to create a new order 
			def order_params
				params.permit(:channel, :brand, :customer_id, :subtotal, :tax, :shipping_method)
			end	

		end
	end
end			