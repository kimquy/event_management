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

  describe 'save_draft!' do
    let(:event) { build(:event_group) }

    it 'save subsets of attributes' do
      event.save_draft!

      expect(event.persisted?).to eq(true)
      expect(event.draft?).to eq(true)
    end
  end

  describe 'publish' do
    let(:event) { build(:event_group) }

    it 'save all attributes' do
      event.publish

      expect(event.persisted?).to eq(true)
      expect(event.draft?).to eq(false)
      expect(event.published?).to eq(true)
    end
  end

  describe 'ensure_time_duration_is_correct' do
    let(:event) { build(:event_group) }

    context 'start date > end date' do
      before do
        event.start_time = Date.current
        event.end_time = Date.current - 1
      end

      it 'not be able to publish' do
        event.publish

        expect(event.persisted?).to eq(false)
      end
    end
  end
end
