class Order < ApplicationRecord
	validates_presence_of :customer_id, :shipping_method, :subtotal, :brand, :channel
	validates :tax, :subtotal, :numericality => true, :format => { :with => /\A\d{1,4}(.\d{0,2})?\z/}
end
