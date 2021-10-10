# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true
  validates :short_url, uniqueness: {scope: :long_url}

  def self.random_code
    loop do
      new_url = SecureRandom.urlsafe_base64
      if !ShortenedUrl.exists?(short_url: new_url)
        return new_url
      end
    end
  end

end
