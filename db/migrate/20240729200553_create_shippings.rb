class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|

      t.string :post_number, null: false
      t.references :order, null: false, foreign_key: true
      t.integer :shipping_source_id, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building
      t.string :phone_number, null: false
      t.timestamps
    end
  end
end
