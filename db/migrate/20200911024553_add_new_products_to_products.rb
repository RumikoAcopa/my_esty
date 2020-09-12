class AddNewProductsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :cleanser, :string
    add_column :products, :toner, :string
    add_column :products, :serum, :string
    add_column :products, :moisturizer, :string
    add_column :products, :exfoliator, :string
    add_column :products, :mask, :string
  end
end
