class CreateJoinTableOrderPromotion < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :promotions do |t|
      t.index [:order_id, :promotion_id]
    end
  end
end
