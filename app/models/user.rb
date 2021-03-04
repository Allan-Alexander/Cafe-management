class User < ApplicationRecord
    has_many :orders # for cashier


    has_secure_password
    validates :password, presence: true
    validates :user_name, presence: true
    validates :user_name, length: {minimum: 3}
    validates :password, length: {minimum: 4}

end
