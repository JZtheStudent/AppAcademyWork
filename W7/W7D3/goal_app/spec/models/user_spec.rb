# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  subject(:capy) { FactoryBot.create(:user) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:session_token) }

  describe 'password encryption' do
    it 'does not save passwords to the DB' do
      FactoryBot.create(:user, username: 'Capy')

      user = User.find_by(username: 'Capy')
      expect(user.password).not_to eq('password')
      expect(user.password_digest).not_to eq('password')
    end

    it 'encrypts our password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('abcdef')

      FactoryBot.build(:user, password: 'abcdef')
    end
  end
end
