# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text             not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Blog < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, uniqueness: {scope: :author_id}
  

  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  has_many :comments,
    foreign_key: :blog_id,
    class_name: :Comment,
    dependent: :destroy

end
