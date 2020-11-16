require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  context 'Association' do
    it 'should belong to the event' do
      ea = EventAttendee.reflect_on_association(:event)
      expect(ea.macro).to eq(:belongs_to)
    end
    it 'should belong to the attendee' do
      ea = EventAttendee.reflect_on_association(:attendee)
      expect(ea.macro).to eq(:belongs_to)
    end
  end
end
