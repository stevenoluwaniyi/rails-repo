class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :channel
      t.string :brand
      t.integer :customer_id
      t.decimal :subtotal
      t.decimal :tax
      t.string :shipping_method
      


      t.timestamps
    end
  end
end
