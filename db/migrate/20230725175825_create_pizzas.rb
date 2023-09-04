class CreatePizzas < ActiveRecord::Migration[7.0]
  def change
    create_table :pizzas do |t|
      t.string :name, null: false, index: { unique: true }
      t.float :price, null: false

      t.timestamps
    end
  end
end
