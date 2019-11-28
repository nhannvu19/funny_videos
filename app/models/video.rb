class Video < ApplicationRecord
  belongs_to :user

  validates :url, presence: true
end
