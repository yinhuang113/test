class ScheduleIntervalsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @mall = Mall.find(params[:mall_id])
    @schedule = Schedule.find(params[:schedule_id])
    @intervals = @schedule.intervals.order('day ASC')
  end

  def new
    @mall = Mall.find(params[:mall_id])
    @schedule = Schedule.find(params[:schedule_id])
    @interval = @schedule.intervals.new
  end

  def create
    @mall = Mall.find(params[:mall_id])
    @schedule = Schedule.find(params[:schedule_id])
    @interval = @schedule.intervals.new(params[:schedule_interval])
    if @interval.save
      flash[:success] = "Interval created!"
      redirect_to mall_schedule_schedule_interval_path(@mall, @schedule, @interval)
    else
      render 'new'
    end
  end

  def show
    @mall = Mall.find(params[:mall_id])
    @schedule = Schedule.find(params[:schedule_id])
    @interval = ScheduleInterval.find(params[:id])
  end

  def edit
    @mall = Mall.find(params[:mall_id])
    @schedule = Schedule.find(params[:schedule_id])
    @interval = ScheduleInterval.find(params[:id])
  end

  def update
    @mall = Mall.find(params[:mall_id])
    @schedule = Schedule.find(params[:schedule_id])
    @interval = ScheduleInterval.find(params[:id])
    if @interval.update_attributes(params[:schedule_interval])
      flash[:success] = "Interval updated"
      redirect_to mall_schedule_schedule_interval_path(@mall, @schedule, @interval)
    else
      render 'edit'
    end
  end

  def destroy
    ScheduleInterval.find(params[:id]).destroy
    flash[:success] = "Schedule destroyed."
    redirect_to schedules_url
  end
end
