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