class Order < ApplicationRecord

  enum state: %w[OPEN COMPLETED]

  validates :state, presence: true, inclusion: { in: states.keys }

  has_many :order_items, dependent: :destroy
  has_and_belongs_to_many :promotions
  belongs_to :discount, optional: true

  def total_price
    apply_promotions
    sum = order_items_sum
    price_after_discount(sum)
  end

  def promotion_codes
    promotions.present? ? promotions.pluck(:name).join(", ") : "-"
  end

  def discount_code
    discount&.name || "-"
  end

  private

  def apply_promotions
    order_items_hash = order_items.group_by { |item| [item.pizza_id, item.size] }

    promotions.each do |p|
      target_pizzas = order_items_hash[[p.target_pizza_id, p.target_size]] || []

      if target_pizzas.size >= p.from
        free_pizzas_count = (p.from - p.to) * multiple(target_pizzas.count, p.from)
        target_pizzas.first(free_pizzas_count).each do |item|
          item.free = true
        end
      end
    end
  end

  def order_items_sum
    sum = 0

    order_items.each do |i|
      price = !i.free ? i.pizza.price * Pizza::SIZE_MULTIPLIERS[i.size] : 0
      price += i.added_ingredients.pluck(:price).sum * Pizza::SIZE_MULTIPLIERS[i.size]
      sum += price
    end
    sum
  end

  def price_after_discount(price)
    return price unless discount.present?

    (price - (discount.deduction_in_percent / 100 * price))
  end

  def multiple(number1, number2)
    number1 % number2 == 0 ? number1 / number2 : 1
  end

end
