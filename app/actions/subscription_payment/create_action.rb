class SubscriptionPayment::CreateAction
  extend LightService::Action

  expects :subscription
  promises :subscription_payment

  executed do |ctx|
    subscription_payment = SubscriptionPayment.create!(
      subscription: ctx.subscription,
      payment_method: "credit_card",
      transaction_id: nil,
      status: :pending,
      amount: ctx.subscription.amount,
      paid_at: nil
    )

    ctx[:subscription_payment] = subscription_payment
  end
end
