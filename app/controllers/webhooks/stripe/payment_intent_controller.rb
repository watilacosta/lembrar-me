module Webhooks::Stripe
  class PaymentIntentController < ApplicationController
    skip_forgery_protection

    def succeeded
    end

    def failed
    end
  end
end
