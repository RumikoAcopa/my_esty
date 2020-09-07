class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :birthdate
      t.string :address
      t.string :phone_number
      t.timestamps null: false
    end
  end
end
