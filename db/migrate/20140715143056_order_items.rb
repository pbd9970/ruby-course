class OrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to order
      t.belongs_to item
    end
  end
end
