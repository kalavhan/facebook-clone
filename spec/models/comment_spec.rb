# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    it { should validate_presence_of(:content) }
    it { should_not allow_value(' ').for(:content) }
    custom_content = (0..99).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(custom_content).for(:content) }
  end
end
