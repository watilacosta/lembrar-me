class DashboardController < BaseController
  def index
    @user_subscriptions = current_user.subscriptions.last
  end
end
