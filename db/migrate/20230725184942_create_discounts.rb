class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name, null: false, index: { unique: true }
      t.float :deduction_in_percent, null: false

      t.timestamps
    end
  end
end
