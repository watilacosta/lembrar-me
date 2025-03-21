# frozen_string_literal: true

class Subscription::New
  extend ::LightService::Organizer

  def self.call(params)
    with(params: params).reduce(
      User::UpdateAccountAction,
      Subscription::CancelPendingSubscriptionAction,
      Subscription::CreateAction,
      Stripe::CreateCheckoutSessionAction
      # Update status to active if payment is successful
      # Update status to error if payment fails and send email to user
    )
  end
end
