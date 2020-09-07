class User < ActiveRecord::Base 
    #now I have a ruby class that represents users
    has_secure_password
    has_many :account
end