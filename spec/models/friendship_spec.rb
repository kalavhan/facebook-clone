require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'Like' do
    it { should belong_to(:sender) }
    it { should belong_to(:receiver) }
    it { should validate_presence_of(:status) }
  end
end
