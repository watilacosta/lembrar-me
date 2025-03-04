# frozen_string_literal: true

module Subscription
  class Create
    extend ::LightService::Organizer

    def self.call(params)
      with(
        plan_id: params[:plan_id],
      ).reduce(actions)
    end

    def self.actions
      [
        User::CreateAccount,
        Subscription::CreateSubscription,
        Payment::CreatePayment,
        Subscription::SendEmail
      ]
    end
  end
end
