# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  password   :string           not null
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "'email' column" do
    it "has been renamed to 'username'" do 
      expect(User.column_names).to include('username')
      expect(User.column_names).not_to include('email')
    end
  end

  describe "'bio' column" do
    it "has been removed" do 
      expect(User.column_names).not_to include('bio')
    end
  end

end
