# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  username         :string           not null
#  passkey          :string           not null
#  favorite_cuisine :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "'passkey' column" do
    it "has been renamed to 'password'" do 
      expect(User.column_names).to include('password')
      expect(User.column_names).not_to include('passkey')
    end
  end

  describe "'favorite_cuisine' column" do
    it "has been removed" do 
      expect(User.column_names).not_to include('favorite_cuisine')
    end
  end

end
