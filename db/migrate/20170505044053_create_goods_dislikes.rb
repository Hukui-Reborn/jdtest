class CreateGoodsDislikes < ActiveRecord::Migration[5.0]
  def change
    create_table :goods_dislikes do |t|
      t.integer :user_id
      t.integer :product_id
      t.timestamps
    end
  end
end
