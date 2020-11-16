class AddColumsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :title, :string
    add_column :events, :location, :string
  end
end
