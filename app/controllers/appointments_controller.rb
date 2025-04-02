class AppointmentsController < BaseController
  def index
    @appointments = authorize Appointment.where(service_id: params[:service_id])
  end

  def new
    @service = Service.find(params[:service_id])
    @appointment = @service.appointments.build(client: current_user)
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to @appointment, notice: "Agendamento criado!"
    else
      render :new
    end
  end

  def confirm
    appointment.update(status: "confirmed")

    redirect_to appointment
  end

  def cancel
    appointment.update(status: "canceled")

    redirect_to appointment
  end

  private

  def appointment
    @appointment ||= Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:service_id, :scheduled_at).merge(client: current_user)
  end
end
