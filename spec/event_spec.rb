require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validation test' do
    it 'should validate username' do
      event = Event.new(date: Date.today, title: 'goody', location: 'Abuja', description: 'stay at home').save
      expect(event).to eq(false)
    end
  end

  describe 'Association' do
    it 'should have many created_events' do
      c = Event.reflect_on_association(:creator)
      expect(c.macro).to eq(:belongs_to)
    end
    it 'should have many event_attendees' do
      c = Event.reflect_on_association(:event_attendees)
      expect(c.macro).to eq(:has_many)
    end
    it 'should have many attended_events' do
      c = Event.reflect_on_association(:attendees)
      expect(c.macro).to eq(:has_many)
    end
  end
end
