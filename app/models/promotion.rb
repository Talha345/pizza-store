class Promotion < ApplicationRecord

  belongs_to :target_pizza, class_name: 'Pizza', foreign_key: 'target_pizza_id'
  enum target_size: %w[Small Medium Large]

  validates :name, presence: true, uniqueness: true
  validates :from, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :to, presence: true, numericality: { greater_than_or_equal_to: 1 }

end
