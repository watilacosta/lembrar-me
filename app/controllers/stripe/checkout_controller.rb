module Stripe
  class CheckoutController < BaseController
    def create
      result = CheckoutSession.call(params)

      if result.success?
        # Redirect to Stripe Checkout
      else
        # Redirect to error page
      end
    end
  end
end
