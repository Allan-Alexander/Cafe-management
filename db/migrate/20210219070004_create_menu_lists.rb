class CreateMenuLists < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_lists do |t|
      t.bigint :menu_id
      t.string :menu_name
      t.string :menu_description
      t.float :menu_price

      t.timestamps
    end
  end
end
