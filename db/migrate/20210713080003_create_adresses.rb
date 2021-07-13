class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :postal_code       , null: false
      t.integer :prefecture_id    , null: false
      t.string :city              , null: false
      t.string :number            , null: false
      t.string :build_name        , null: false
      t.string :telephone         , null: false
      t.references :purchase      , null: false
      t.timestamps
    end
  end
end
