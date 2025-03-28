class SubscriptionPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def new?
    create?
  end

  def create?
    user.client? && !user.has_active_subscription?
  end

  def toggle_active?
    index?
  end

  def cancel?
    index?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
