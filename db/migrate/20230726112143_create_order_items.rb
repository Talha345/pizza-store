class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :pizza, null: false, foreign_key: true
      t.string :size, null: false
      t.integer :add, array: true, default: []
      t.integer :remove, array: true, default: []

      t.timestamps
    end
  end
end
