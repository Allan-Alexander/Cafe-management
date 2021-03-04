class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :order_id, :cart_id
  end
end
