# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text             not null
#  uploader_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Video < ApplicationRecord; end
