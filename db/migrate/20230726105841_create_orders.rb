class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.uuid :uuid, null: false, index: { unique: true }
      t.integer :state, null: false, default: 0
      t.references :discount, foreign_key: true
      t.timestamps
    end
  end
end
