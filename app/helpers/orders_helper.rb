module OrdersHelper

  def price_in_euros(price)
    number_with_precision(price, precision: 2) + "€"
  end
end
