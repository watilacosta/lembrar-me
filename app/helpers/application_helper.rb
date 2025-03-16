module ApplicationHelper
  def user_role
    I18n.t("activerecord.enums.user.role.#{current_user.role}", default: current_user.role.humanize)
  end
end
