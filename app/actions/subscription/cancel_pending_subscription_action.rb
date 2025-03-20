class Subscription::CancelPendingSubscriptionAction
  extend LightService::Action

  expects :user

  executed do |ctx|
    pending_subscription = ctx.user.subscriptions.pending.last

    next ctx unless pending_subscription.present?

    pending_subscription.update(status: :canceled)

    ctx.fail!("Pending subscription not canceled") unless pending_subscription.canceled?
  end
end
