# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

pizzas = {
  'Margherita': 5.0,
  'Salami': 6.0,
  'Tonno': 8.0
}

pizzas.each do |k, v|
  Pizza.create(name: k, price: v)
end

ingredients = {
  'Onions': 1,
  'Cheese': 2,
  'Olives': 2.5,
}

ingredients.each do |k, v|
  Ingredient.create(name: k, price: v)
end

discount_codes = { 'SAVE5': 5 }

discount_codes.each do |k, v|
  Discount.create(name: k, deduction_in_percent: v)
end

promotions = [{
  name: '2FOR1',
  target_pizza_id: Pizza.find_by(name: 'Salami').id,
  target_size: 'Small',
  from: 2,
  to: 1
}]

promotions.each do |promotion|
  Promotion.create(promotion)
end

#### Order Creation ####
data = [
  {
    "id": "316c6832-e038-4599-bc32-2b0bf1b9f1c1",
    "state": "OPEN",
    "createdAt": "2021-04-14T11:16:00Z",
    "items": [
      {
        "name": "Tonno",
        "size": "Large",
        "add": [],
        "remove": []
      }
    ],
    "promotionCodes": [],
    "discountCode": nil
  },
  {
    "id": "f40d59d0-48bd-409a-ac7b-54a1b47f6680",
    "state": "OPEN",
    "createdAt": "2021-04-14T13:17:25Z",
    "items": [
      {
        "name": "Margherita",
        "size": "Large",
        "add": ["Onions", "Cheese", "Olives"],
        "remove": []
      },
      {
        "name": "Tonno",
        "size": "Medium",
        "add": [],
        "remove": ["Onions", "Olives"]
      },
      {
        "name": "Margherita",
        "size": "Small",
        "add": [],
        "remove": []
      }
    ],
    "promotionCodes": [],
    "discountCode": nil
  },
  {
    "id": "9232679d-e3fd-40bd-81f4-7114ea96e420",
    "state": "OPEN",
    "createdAt": "2021-04-14T14:08:47Z",
    "items": [
      {
        "name": "Salami",
        "size": "Medium",
        "add": ["Onions"],
        "remove": ["Cheese"]
      },
      {
        "name": "Salami",
        "size": "Small",
        "add": [],
        "remove": []
      },
      {
        "name": "Salami",
        "size": "Small",
        "add": [],
        "remove": []
      },
      {
        "name": "Salami",
        "size": "Small",
        "add": [],
        "remove": []
      },
      {
        "name": "Salami",
        "size": "Small",
        "add": ["Olives"],
        "remove": []
      }
    ],
    "promotionCodes": ["2FOR1"],
    "discountCode": "SAVE5"
  }
]

data.each do |o|
  discount_id = Discount.find_by(name: o[:discountCode])&.id
  items = o[:items]
  order = Order.new(uuid: o[:id], discount_id: discount_id)
  items.each do |item|
    pizza_id = Pizza.find_by(name: item[:name])&.id
    add = item[:add].map { |i| Ingredient.find_by(name: i)&.id }.compact
    remove = item[:remove].map { |i| Ingredient.find_by(name: i)&.id }.compact
    order.order_items.new(pizza_id: pizza_id, size: item[:size], add: add, remove: remove)
  end
  order.promotions = Promotion.where(name: o[:promotionCodes])
  order.save!
end

