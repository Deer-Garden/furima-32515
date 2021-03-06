class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,        default: "", null: false
      t.integer :prefecture,                     null: false
      t.string :city,               default: "",  null: false
      t.string :street,             default: "",  null: false
      t.string :build,              default: "",  null: false
      t.string :phone,                           null: false
      t.references :order,                        null: false, foreign_key: true
      t.timestamps
    end
  end
end
