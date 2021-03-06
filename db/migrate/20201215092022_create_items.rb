class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string     :name          , null: false
      t.integer    :price         , null: false
      t.text       :explanation   , null: false
      t.integer    :category_id   , null: false
      t.integer    :status_id     , null: false
      t.integer    :ship_method_id     , null: false
      t.integer    :area_id       , null: false
      t.integer    :ship_date_id       , null: false
      t.references  :user          , null: false, foreign_key: true
    end
  end
end
