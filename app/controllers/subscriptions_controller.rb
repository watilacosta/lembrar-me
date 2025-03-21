class SubscriptionsController < BaseController
  def new
    @subscription = authorize current_user.subscriptions.new(
      plan_id: params[:plan_id],
      starts_at: Time.current,
    )
  end

  def create
    authorize Subscription, :create?

    result = Subscription::New.call(subscription_params)
    # Se o pagamento for bem sucedido, atualizar a subscription para active
    # Se o pagamento falhar, atualizar a subscription para erro e enviar um email para o usuário

    if result.success?
      redirect_to result.session.url, allow_other_host: true
    else
      render :new
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(
      :user_id, :starts_at, :plan_id, :duration_in_days,
      user_attributes: [ :email, :name, :id ]
    )
  end
end
