module Site
  class HomeController < ApplicationController
    def index
      @plans = Rails.cache.fetch("plans", expires_in: 1.hour) do
        Plan.all
      end
    end
  end
end
