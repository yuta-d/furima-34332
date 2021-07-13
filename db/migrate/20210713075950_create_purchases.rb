class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :item
      t.references :user
      t.timestamps
    end
  end
end
