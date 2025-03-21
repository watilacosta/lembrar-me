# frozen_string_literal: true

class Subscription::New
  extend ::LightService::Organizer

  def self.call(params)
    with(params: params).reduce(
      User::UpdateAccountAction,
      Subscription::CancelPendingSubscriptionAction,
      Subscription::CreateAction,
      Stripe::CreateCheckoutSessionAction
    )
  end
end
