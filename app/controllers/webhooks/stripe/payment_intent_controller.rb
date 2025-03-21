module Webhooks::Stripe
  class PaymentIntentController < ApplicationController
    def succeeded
      # Update status to active if payment is successful
    end

    def failed
      # Update status to error if payment fails and send email to user
    end
  end
end
