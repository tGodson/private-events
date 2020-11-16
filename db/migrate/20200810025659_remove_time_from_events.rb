class RemoveTimeFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :time, :string
    add_column :events, :date, :datetime
  end
end
