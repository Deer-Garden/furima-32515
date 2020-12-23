class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer :card_number,       null: false
      t.integer :expiration,        null: false
      t.integer :code,              null: false
      t.references :user,           null: false,   foreign_key: true
      t.timestamps
    end
  end
end
