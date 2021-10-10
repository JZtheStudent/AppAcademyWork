# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  location   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Restaurant < ApplicationRecord
  
end
