# frozen_string_literal: true

class Subscription::CreateAction
  extend ::LightService::Action

  expects :params
  promises :subscription

  executed do |ctx|
    ctx[:subscription] = Subscription.create(
      plan_id: ctx.params[:plan_id],
      starts_at: Time.current,
      user: ctx.user,
      status: :pending,
      duration_in_days: ctx.params[:duration_in_days]
    )
  end

  rolled_back do |ctx|
  end
end
