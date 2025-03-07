class SubscriptionsController < BaseController
  def new
    @subscription = Subscription.new
  end
end
