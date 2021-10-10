# == Schema Information
#
# Table name: comments
#
#  id           :bigint           not null, primary key
#  body         :string           not null
#  video_id     :integer          not null
#  parent_comment_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  commenter_id :integer
#

class Comment < ApplicationRecord
  
  belongs_to :video,
    foreign_key: :video_id,
    class_name: :Video
  
  belongs_to :commenter,
    foreign_key: :commenter_id,
    class_name: :User
  
  belongs_to :parent_comment,
    foreign_key: :parent_comment_id,
    class_name: :Comment,
    optional: true # maybe we don't have a foreign_key
  
  has_many :replies,
    foreign_key: :parent_comment_id,
    class_name: :Comment
  
  has_one :parent_commenter, 
    through: :parent_comment,
    source: :commenter

end

# person: 'yooo' <-- parent, parent doesnt have a parent itself, therefore optional: true
  # person 2: 'what up'
    # person 3: 'hello'


# do all of the foreign keys belongs_to --> has_manys
# everything else has_many throughs