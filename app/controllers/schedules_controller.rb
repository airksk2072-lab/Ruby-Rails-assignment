class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    Rails.logger.debug @schedule.inspect
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path
  end
end

private

def schedule_params
  params.require(:schedule).permit(:title, :start_date, :end_date, :is_all_day, :note)
end