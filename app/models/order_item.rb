class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :menu_list
end
