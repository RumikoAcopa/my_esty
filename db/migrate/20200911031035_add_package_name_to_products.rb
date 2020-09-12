class AddPackageNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :package_name, :string
  end
end
