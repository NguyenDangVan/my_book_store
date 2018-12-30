class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.string :address
      t.string :phone
      t.integer :role, default: 0
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email
  end
end
