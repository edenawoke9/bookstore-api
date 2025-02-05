class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.decimal :price
      t.text :description
      t.integer :stock
      t.string :cover_image_url
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
