require 'rails_helper'

RSpec.describe Order, type: :model do
	subject { described_class.new}

  it "is valid with valid attributes" do
  	subject.customer_id = 123456
  	subject.shipping_method = "UPS"
  	subject.subtotal = 13.34
  	subject.brand = "Deluxe"
  	subject.channel = "WEB"
  	expect(subject).to be_valid
  end

  it "is not valid without a customer id" do
  	subject.customer_id = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a shipping method" do
  	subject.shipping_method = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a subtotal" do
  	subject.subtotal = nil
  	expect(subject).to_not be_valid
  end

  it "is not vaild without a brand" do
  	subject.brand = nil
  	expect(subject).to_not be_valid
  end

  it "is not vaild without a channel" do
  	subject.channel = nil
  	expect(subject).to_not be_valid
  end
end
