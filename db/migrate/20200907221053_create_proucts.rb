class CreateProucts < ActiveRecord::Migration
  def change
    create_table :proucts do |t|
      t.integer :user_id
      t.string :name
      t.string :size
      t.string :description
      t.timestamps null: false
    end
  end
end
