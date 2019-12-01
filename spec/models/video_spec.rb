require 'rails_helper'

describe Video, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:url) }

  describe '#youtube_embed_url' do
    let(:video) { Video.create(user_id: 1, url: 'https://www.youtube.com/watch?v=ctrdbTqVLy8') }

    it 'should return youtube embed url' do
      expect(video.youtube_embed_url).to eq 'https://youtube.com/embed/ctrdbTqVLy8'
    end
  end
end
