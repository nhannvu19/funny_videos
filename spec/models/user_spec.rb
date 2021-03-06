require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:videos) }
  it { is_expected.to validate_presence_of(:email) }
end