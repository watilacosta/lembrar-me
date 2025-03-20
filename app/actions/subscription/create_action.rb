# frozen_string_literal: true

class Subscription::CreateAction
  extend ::LightService::Action

  expects :params
  promises :subscription

  executed do |ctx|
    ctx[:subscription] = Subscription.create!(
      plan_id: ctx.params[:plan_id],
      starts_at: Time.current,
      user: ctx.user,
      status: :pending,
      duration_in_days: ctx.params[:duration_in_days]
    )
  end

  rolled_back do |ctx|
    # TODO: aqui precisa analisar se o pagamento foi bem sucedido ou não
    # TODO: Se o pagamento foi bem sucedido, a subscription deve ser atualizada para active
    if ctx.user.subscriptions.pending.last.any?
      ctx.user.subscriptions.pending.last.update(status: :pending)
    end
  end
end
