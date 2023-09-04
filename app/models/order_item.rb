class OrderItem < ApplicationRecord

  attr_accessor :free
  after_initialize :set_free

  belongs_to :order
  belongs_to :pizza

  validates :size, presence: true, inclusion: { in: Pizza::PIZZA_SIZES }

  def name
    pizza.name
  end

  def added_ingredients
    ingredients(add)
  end

  def removed_ingredients
    ingredients(remove)
  end

  private

  def set_free
    self.free = false
  end

  def ingredients(ids)
    Ingredient.where(id: ids)
  end

end
