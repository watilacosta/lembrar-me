class AppointmentPolicy < ApplicationPolicy
  def index?
    # TODO: Analisar essa policy se esta é a melhor forma de fazer
    record.service.user == user
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
