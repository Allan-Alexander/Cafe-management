class CartItem < ApplicationRecord
    belongs_to :cart
    belongs_to :menu_list
end
