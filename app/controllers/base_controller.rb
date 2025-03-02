class BaseController < ApplicationController
  layout "devise"

  before_action :authenticate_user!
end
