class AddDeliveredAtToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivered_at, :boolean
  end
end
