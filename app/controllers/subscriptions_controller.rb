class SubscriptionsController < BaseController
  before_action :plan, only: [ :create ]

  def new
    @subscription = current_user.subscriptions.new(
      plan_id: params[:plan_id],
      starts_at: Time.current,
    )
  end

  def create
    # TODO: Move to organizer
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to root_path, notice: "Subscription was successfully created."
    else
      render :new
    end
  end

  private

  def plan
    @plan ||= Plan.find(subscription_params[:plan_id])
  end

  def subscription_params
    params.require(:subscription).permit(:plan_id, :email)
  end
end
