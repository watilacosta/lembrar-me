class BaseController < ApplicationController
  include Pundit::Authorization

  layout "devise"

  before_action :authenticate_user!
end
