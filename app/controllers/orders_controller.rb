class OrdersController < ApplicationController
  def index
    @orders = Order.OPEN
  end

  def update
    order = Order.find_by(uuid: params[:id])
    if order.update(state: 1)
      # flash messages haven't been implemented in this project but this is how the update method should behave ideally.
      flash[:success] = "Order marked as completed"
    else
      flash[:error] = order.errors.full_messages.to_sentence
    end
    redirect_to request.referer
  end
end
