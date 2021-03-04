class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.bigint :order_id
      t.bigint :menu_list_id
      t.string :menu_list_name
      t.float :menu_list_price

      t.timestamps
    end
  end
end
