module Api
	module V1
		class OrdersController < ApplicationController
			def index
				order_stat = Order.order('channel DESC');
				render json: order_stat, status: :ok
			end

			def show
				order_stat = Order.find(params[:id]);
				render json: order_stat, status: :ok
			end	
			#Creates a new order and confirm if the order has been successfully created
			def create
				order_stat = Order.new(order_params);
				if order_stat.save
					render json: order_stat, status: :ok
				else
					render json: order_stat.errors, status: :unprocessable_entity

				end
			end
			#Method to delete an order. Find the parameter ID and delete the order
			def destroy
				order_stat = Order.find(params[:id]);
				order_stat.delete;
				render json: order_stat, status: :ok #okay
			end

			#Get the ID of the order and update the neccessary attributes
			def update
				order_stat = Order.find(params[:id]);
				if order_stat.update_attributes(order_params)
					render json: order_stat, status: :ok
				else
					render json: order_stat.errors, status: :unprocessable_entity
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