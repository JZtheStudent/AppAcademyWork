# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
include ActionView::Helpers::DateHelper

  COLORS = ['black', 'white', 'gray', 'brown']

  validates :sex, inclusion: ['M', 'F']
  validates :color, inclusion: COLORS
  validates :sex, :name, :birth_date, :color, :description, presence: true
  
  def age 
    age = time_ago_in_words(birth_date)
  end

  has_many :requests,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

end
