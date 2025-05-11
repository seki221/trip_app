class SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[ show edit update destroy ]
  before_action :set_planner

  # GET /schedules or /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1 or /schedules/1.json
  def show
    @schedule = current_user.schedule.find(params[:id])
    @schedule = Schedule.find(params[:id])
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    @planner = Planner.find(params[:planner_id])
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules or /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)
    @planner = Planner.find(params[:planner_id])
    @schedule = @planner.schedules.build(schedule_params)
    @schedule.user = current_user

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to planner_schedules_path(@planner), notice: "Schedule was successfully created." }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1 or /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: "Schedule was successfully updated." }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1 or /schedules/1.json
  def destroy
    @schedule.destroy!

    respond_to do |format|
      format.html { redirect_to planner_schedules_path(@planner), status: :see_other, notice: "Schedule was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def schedule_params
      params.require(:schedule).permit(:user_id, :planner_id, :destination, :start_date, :end_date, :cost, :description, :address)
    end

    def set_planner
      @planner = Planner.find(params[:planner_id])
    end
end
