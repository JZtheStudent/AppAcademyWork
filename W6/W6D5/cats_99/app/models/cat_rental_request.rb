# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CatRentalRequest < ApplicationRecord

  validates :status, inclusion: ['PENDING', 'APPROVED', 'DENIED']
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :does_not_overlap_approved_request
  
  def overlapping_requests
    
    matching_rentals = CatRentalRequest
      .where('(start_date BETWEEN ? AND ?)
           OR (end_date BETWEEN ? AND ?)', start_date, end_date, start_date, end_date)
      .where('cat_id = ?', cat_id)
    
  end

  def overlapping_approved_requests
    overlapping_requests.select { |matches| matches.status == 'APPROVED' }
  end
  
  def does_not_overlap_approved_request
    unless overlapping_approved_requests.empty?
      errors[:body] << "conflicting times (cat is taken rn)"
    end
  end

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat 

end
