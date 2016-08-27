require 'rails_helper'

RSpec.describe API::EventGroupsController, type: :controller do
  let!(:event1) { create(:event_group, name: 'Event 1') }
  let!(:event2) { create(:event_group, name: 'Event 2') }
  let!(:event3) { create(:event_group, name: 'Event 3') }

  describe '#index' do
    it 'returns list of events' do
      process :index, method: :get
      events = JSON.parse(response.body)

      expect(events.size).to eq(3)
      expect(events.map { |e| e['name'] }).to eq(['Event 1', 'Event 2', 'Event 3'])
    end
  end

  describe '#show' do
    let(:params) {
      {
        id: event1.id
      }
    }

    subject { process :show, method: :get, params: params }

    it 'returns event' do
      expected_event = JSON.parse(subject.body)

      expect(expected_event['name']).to eq('Event 1')
    end
  end

  describe '#create' do
    let(:params) {
      {
        event_group: {
          name: 'Awesome event',
          description: 'Ruby on Rails',
          location: 'HCM',
          start_time: Date.current,
          end_time: Date.current + 1
        }
      }
    }

    before { process :create, method: :post, params: params }

    it 'creates new event' do
      expected_event = EventGroup.last

      expect(expected_event.name).to eq('Awesome event')
      expect(expected_event.description).to eq('Ruby on Rails')
      expect(expected_event.location).to eq('HCM')
    end
  end

  describe '#update' do
    let(:params) {
      {
        id: event1.id,
        event_group: {
          name: 'Cool Event'
        }
      }
    }

    before { process :update, method: :put, params: params }

    it 'updates event info' do
      expect(event1.reload.name).to eq('Cool Event')
    end
  end

  describe '#destroy' do
    let(:params) {
      {
        id: event1.id,
      }
    }

    before { process :destroy, method: :delete, params: params }

    it 'destroy softly event' do
      expect(event1.reload.deleted_at).not_to eq(nil)
    end
  end
end
