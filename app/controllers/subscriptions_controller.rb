class SubscriptionsController < BaseController
  def new
    @subscription = Subscription.new(plan_id: params[:plan_id])
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to root_path, notice: "Subscription was successfully created."
    else
      render :new
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:plan_id, :email)
  end
end
