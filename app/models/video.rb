class Video < ApplicationRecord
  belongs_to :user

  validates :url, presence: true

  def youtube_embed_url
    code = url.split('v=').last
    "https://youtube.com/embed/#{code}"
  end
end
