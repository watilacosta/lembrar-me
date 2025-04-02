class CustomerPolicy < ApplicationPolicy
  def index?
    # TODO: Melhorar a lógica de autorização
    user.professional? && user.has_active_subscription?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
