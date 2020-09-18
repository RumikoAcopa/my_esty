class Product < ActiveRecord::Base
    validates :package_name, presence: true #TO NOT PERSIST BAD DATA! AKA EMPTY FIELDS!!!
    belongs_to :user
end
