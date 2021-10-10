# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  password   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  has_many :likes,
    foreign_key: :liker_id,
    class_name: :Like
  
  has_many :videos,
    foreign_key: :uploader_id,
    class_name: :Video
  
  has_many :comments,
    foreign_key: :commenter_id,
    class_name: :Comment

  has_many :liked_videos,
    through: :likes,
    source: :video
  
  has_many :videos_commented,
    through: :comments,
    source: :video
  
  has_many :likers,
    through: :videos,
    source: :likers
end
  

  # has_many :likers, <-- method name, specs wanna call it
  #   through: :videos, <-- an assocations in THIS same class, but you wanna look at where it takes you, what class
  #   source: :likers <-- association in the class you end up in