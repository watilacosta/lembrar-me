class ServicePolicy < ApplicationPolicy
  def index?
    user.admin? || user.has_active_subscription?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
