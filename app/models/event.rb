class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendees
  has_many :attendees, through: :event_attendees
  validates :title, :description, :location, :date, presence: true

  scope :upcoming_events, -> { where('date > ?', Date.today) }
  scope :previous_events, -> { where('date < ?', Date.today) }
end
