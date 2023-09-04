class Pizza < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  PIZZA_SIZES = %w[Small Medium Large].freeze

  SIZE_MULTIPLIERS = {
    'Small' => 0.7,
    'Medium' => 1,
    'Large' => 1.3
  }.freeze

end
