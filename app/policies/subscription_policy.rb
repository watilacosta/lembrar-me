class SubscriptionPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.client? && !user.has_active_subscription?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
