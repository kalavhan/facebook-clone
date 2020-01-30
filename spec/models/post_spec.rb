require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post' do
    it { should validate_presence_of(:content) }
    it { should belong_to(:user) }
    it { should_not allow_value(' ').for(:content) }
    custom_content = (0..256).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(custom_content).for(:content) }
  end
end
