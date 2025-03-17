# frozen_string_literal: true

module Plan
  class Find
    extend ::LightService::Action

    expects :plan_id

    executed do |ctx|
      ctx.plan = Plan.find_by(id: ctx.plan_id)
      ctx.fail_and_return!("Plano com ID #{ctx.plan_id} não encontrado.") if ctx.plan.nil?
    end
  end
end
