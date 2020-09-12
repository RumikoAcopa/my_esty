class User < ActiveRecord::Base 
    #now I have a ruby class that represents users
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    has_many :products
end
