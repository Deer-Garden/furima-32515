class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,        default: "", null: false
      t.integer :prefecture,                     null: false
      t.string :city,               default: ""
      t.string :street,             default: ""
      t.string :build,              default: ""
      t.string :phone,                           null: false
      t.references :user,                        null: false, foreign_key: true
      t.timestamps
    end
  end
end
