require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    subject do
      described_class.new(username: 'tGodson')
    end

    it 'should be valid with a valid username' do
      expect(subject).to be_valid
    end

    it 'should not be valid without a username' do
      subject.username = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Association' do
    it 'should have many created_events' do
      u = User.reflect_on_association(:created_events)
      expect(u.macro).to eq(:has_many)
    end
    it 'should have many event attendees' do
      u = User.reflect_on_association(:event_attendees)
      expect(u.macro).to eq(:has_many)
    end
    it 'should have many attended events' do
      u = User.reflect_on_association(:attended_events)
      expect(u.macro).to eq(:has_many)
    end
  end
end
