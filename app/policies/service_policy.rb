class ServicePolicy < ApplicationPolicy
  def index?
    user.admin? || user.has_active_subscription?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def create?
    user.client?
  end

  def update?
    user.client? && record.user == user
  end

  def destroy?
    user.client? && record.user == user
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
