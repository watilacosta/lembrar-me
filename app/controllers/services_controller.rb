class ServicesController < BaseController
  def index
    @services = authorize current_user.services
  end

  def new
    @service = authorize Service.new(user: current_user)
  end

  def edit
    @service = authorize Service.find(params[:id])
  end

  def create
    @service = authorize Service.new(service_params)

    if @service.save
      redirect_to services_path, notice: "Serviço criado com sucesso."
    else
      render :new
    end
  end

  def update
    @service = authorize Service.find(params[:id])

    if @service.update(service_params)
      redirect_to services_path, notice: "Serviço atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @service = authorize Service.find(params[:id])

    if @service.destroy
      redirect_to services_path, notice: "Serviço excluído com sucesso."
    else
      redirect_to services_path, alert: "Erro ao excluir o serviço."
    end
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :price).merge(user: current_user)
  end
end
