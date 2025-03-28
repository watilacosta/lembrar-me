# frozen_string_literal: true

module Stripe
  class CreateCheckoutSessionAction
    extend ::LightService::Action

    promises :session

    executed do |ctx|
      ctx[:session] = Stripe::Checkout::Session.create({
        customer_email: ctx.user.email,
        payment_method_types: [ "card" ],
        line_items: [
         {
           quantity: 1,
           price: ctx.subscription.plan.stripe_price_id
         }
        ],
        mode: "subscription",
        success_url: "http://0.0.0.0:3000/" + "dashboard",
        cancel_url: "http://0.0.0.0:3000/" + "subscriptions/new?plan_id=#{ctx.subscription.plan.id}"
      })
    end
  end
end
