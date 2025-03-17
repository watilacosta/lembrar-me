class PlansController < BaseController
  before_action :set_plan, only: [ :edit, :update ]

  def index
    authorize Plan

    @plans = Plan.all
  end

  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to plans_path
    else
      render :edit
    end
  end

  private

  def set_plan
    @plan = authorize Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :description, :features_list, :price, :stripe_product_id)
  end
end
