# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User' do
    first_name = (0..26).map { ('a'..'z').to_a[rand(26)] }.join
    it { should validate_presence_of(:first_name) }
    it { should allow_value('Kalavhan').for(:first_name) }
    it { should_not allow_value(first_name).for(:first_name) }
    it { should_not allow_value('').for(:first_name) }

    last_name = (0..26).map { ('a'..'z').to_a[rand(26)] }.join
    it { should validate_presence_of(:last_name) }
    it { should allow_value('Smith').for(:first_name) }
    it { should_not allow_value(last_name).for(:last_name) }
    it { should_not allow_value('').for(:last_name) }

    it { should validate_presence_of(:email) }
    it { should allow_value('jhon@mail.com').for(:email) }
    it { should_not allow_value('jhon').for(:email) }
    it { should_not allow_value('').for(:email) }

    it { should validate_presence_of(:password) }
    it { should allow_value('29r5g0!').for(:password) }
    it { should_not allow_value('29').for(:password) }
    it { should_not allow_value('').for(:password) }

    location = (0..41).map { ('a'..'z').to_a[rand(26)] }.join
    it { should allow_value('Amsterdam').for(:location) }
    it { should_not allow_value(location).for(:location) }

    bio = (0..151).map { ('a'..'z').to_a[rand(26)] }.join
    it { should allow_value('Focused in coding, learn something new everyday').for(:bio) }
    it { should_not allow_value(bio).for(:bio) }

    it { should allow_value('Male').for(:gender) }
    it { should allow_value('Female').for(:gender) }
    it { should_not allow_value('mskms').for(:gender) }

    it { should allow_value('Single').for(:status) }
    it { should allow_value('Married').for(:status) }
    it { should allow_value('In a relationship').for(:status) }
    it { should_not allow_value('mskms').for(:gender) }

    it { should have_many(:posts) }
  end
end
