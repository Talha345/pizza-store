class Discount < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :deduction_in_percent, presence: true, numericality: { greater_than_or_equal_to: 0 }

end