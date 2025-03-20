class BaseController < ApplicationController
  include Pundit::Authorization

  layout "devise"

  before_action :authenticate_user!
  after_action :verify_authorized
end
