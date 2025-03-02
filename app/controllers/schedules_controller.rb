class SchedulesController < BaseController
  before_action :set_schedule, only: %i[ show edit update destroy ]

  # GET /schedules
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      redirect_to @schedule, notice: "Schedule was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if @schedule.update(schedule_params)
      redirect_to @schedule, notice: "Schedule was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy!
    redirect_to schedules_path, notice: "Schedule was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.expect(schedule: [ :user_id, :available_at, :booked ])
    end
end
