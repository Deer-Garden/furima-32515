class RemoveGenreIdFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :name, :integer
  end
end
