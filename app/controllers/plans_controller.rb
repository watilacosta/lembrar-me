class PlansController < BaseController
  def index
    @plans = Plan.all
  end
end
