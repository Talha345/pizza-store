class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name, null: false, index: { unique: true }
      t.references :target_pizza, null: false, foreign_key: { to_table: :pizzas }
      t.integer :target_size, null: false
      t.integer :from, null: false
      t.integer :to, null: false

      t.timestamps
    end
  end
end
