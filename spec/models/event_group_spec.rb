require 'rails_helper'

RSpec.describe EventGroup, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }

  it 'has two type of statuses' do
    expect(EventGroup.statuses.keys).to eq(%w(draft published))
  end

  describe 'destroy' do
    let!(:event) { create(:event_group) }

    it 'soft delete only' do
      expect(event.persisted?).to eq(true)
      expect(event.deleted_at).to eq(nil)

      event.destroy

      expect(event.deleted_at).not_to eq(nil)
    end
  end
end
