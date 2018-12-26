class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :pblisher
      t.date :pubished_at
      t.text :description
      t.float :price
      t.integer :quantity
      t.string :image
      t.references :category, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
