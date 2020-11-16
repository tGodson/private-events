class RemoveColumFromEventAttendees < ActiveRecord::Migration[5.2]
  def change
    remove_column :event_attendees, :attended_event_id, :integer
    add_column :event_attendees, :event_id, :integer
  end
end
