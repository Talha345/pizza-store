module OrdersHelper

  def price_in_euros(price)
    number_with_precision(price, precision: 2) + "€"
  end

  def display_datetime(datetime)
    datetime.strftime('%B %-d, %Y %H:%M')
  end

end
