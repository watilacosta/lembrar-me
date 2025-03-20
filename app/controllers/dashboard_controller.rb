class DashboardController < BaseController
  def index
    authorize :dashboard, :index?

    @user_subscriptions = current_user.subscriptions.last
  end
end
