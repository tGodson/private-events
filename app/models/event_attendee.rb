class EventAttendee < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: 'User', foreign_key: :attendee_id
end
