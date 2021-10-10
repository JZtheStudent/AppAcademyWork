# == Schema Information
#
# Table name: invitations
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  guest_id   :integer
#  party_id   :integer
#
# Indexes
#
#  index_invitations_on_guest_id  (guest_id)
#  index_invitations_on_party_id  (party_id)
#
class Invitation < ApplicationRecord
  # N.B. Remember, Rails 5 automatically validates the presence of
  # belongs_to associations, so we can leave the presence validation of
  # party and guest out here.
  belongs_to :party
  belongs_to :guest
end
