# frozen_string_literal: true

module Stripe
  class CreateCheckoutSession
    extend ::LightService::Action

    expects :plan

    executed do |ctx|
      @session = Stripe::Checkout::Session.create(
        payment_method_types: [ "card" ],
        line_items: [
          {
            name: ctx.plan.name,
            description: ctx.plan.description,
            amount: ctx.price,
            currency: "brl",
            quantity: ctx.period
          }
        ],
        success_url: dashboard_path,
        cancel_url: dashboard_path,
        )
    end

    rolled_back do |ctx|
    end
  end
end
