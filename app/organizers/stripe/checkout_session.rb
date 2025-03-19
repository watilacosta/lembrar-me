# frozen_string_literal: true

module Stripe
  class CheckoutSession
    extend ::LightService::Organizer

    def self.call(params)
      with(
        plan_id: params[:plan_id],
        period: params[:period]
      ).reduce(actions)
    end

    def self.actions
      [
        ::Plan::Find,
        ::Subscrition::New,
        ::Stripe::CreateCheckoutSession
      ]
    end
  end
end
