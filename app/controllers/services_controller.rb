class ServicesController < BaseController
  def index = Service.all

  def show
    @service = Service.find(params[:id])
  end
end
