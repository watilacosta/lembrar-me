# frozen_string_literal: true

module Stripe
  class CreateCheckoutSessionAction
    extend ::LightService::Action

    promises :session

    executed do |ctx|
      ctx[:session] = Stripe::Checkout::Session.create({
        payment_method_types: [ "card" ],
        line_items: [
         {
           quantity: ctx.subscription.duration_in_days / 30,
           price: ctx.subscription.plan.stripe_price_id
         }
        ],
        mode: "payment",
        success_url: "http://0.0.0.0:3000/" + "dashboard",
        cancel_url: "http://0.0.0.0:3000/" + "subscriptions/new?plan_id=#{ctx.subscription.plan.id}"
      })
    end
  end
end
