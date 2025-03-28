class SubscriptionsController < BaseController
   def index
    @subscriptions = authorize Subscription.except_canceled.order(
      Arel.sql("CASE status WHEN 'pending' THEN 0 ELSE 1 END, created_at DESC")
    )
  end

  def new
    @subscription = authorize current_user.subscriptions.new(
      plan_id: params[:plan_id],
      starts_at: Time.current,
    )
  end

  def create
    authorize Subscription, :create?

    result = Subscription::New.call(subscription_params)

    if result.success?
      redirect_to result.session.url, allow_other_host: true
    else
      @subscription = result.subscription

      render :new
    end
  end

  def toggle_active
    @subscription = authorize Subscription.find(params[:id])
    @subscription.toggle_active!

    redirect_to subscriptions_path
  end

   def cancel
    @subscription = authorize Subscription.find(params[:id])
    @subscription.update(status: :canceled)

    redirect_to subscriptions_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(
      :user_id, :starts_at, :plan_id, :duration_in_days,
      user_attributes: [ :email, :name, :id ]
    )
  end
end
