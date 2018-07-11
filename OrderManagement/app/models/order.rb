class Order < ApplicationRecord
	validates_presence_of :customer_id, :shipping_method, :subtotal, :brand, :channel
end
