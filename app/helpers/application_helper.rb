module ApplicationHelper
  def user_role
    I18n.t("activerecord.enums.user.role.#{current_user.role}", default: current_user.role.humanize)
  end

  def select_plan_link(plan_id)
    user_signed_in? ?
      new_subscription_path(plan_id:) :
      new_user_registration_path(plan_id:)
  end
end
