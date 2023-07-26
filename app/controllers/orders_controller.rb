class OrdersController < ApplicationController

  def index
    @orders = Order.OPEN
  end

  def update
    order = Order.find_by(uuid: params[:id])
    if order.present?
      order.update(state: 1)
      redirect_to request.referer
    end
  end
end
