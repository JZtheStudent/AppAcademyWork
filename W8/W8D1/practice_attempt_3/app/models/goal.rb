# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  details    :string           not null
#  status     :boolean          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
  validates :name, :details, :user_id, presence: true
  

  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User

end
