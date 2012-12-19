class SchedulesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @mall = Mall.find(params[:mall_id])
    @schedules = @mall.schedules.order('priority DESC')
  end

  def new
    @mall = Mall.find(params[:mall_id])
    @schedule = @mall.schedules.new
  end

  def create
    @mall = Mall.find(params[:mall_id])
    @schedule = @mall.schedules.new(params[:schedule])
    if @schedule.save
      flash[:success] = "Schedule created!"
      redirect_to mall_schedule_path(@mall, @schedule)
    else
      render 'new'
    end
  end

  def show
    @mall = Mall.find(params[:mall_id])
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @mall = Mall.find(params[:mall_id])
    @schedule = Schedule.find(params[:id])
  end

  def update
    @mall = Mall.find(params[:mall_id])
    @schedule = Schedule.find(params[:id])
    if @schedule.update_attributes(params[:schedule])
      flash[:success] = "Schedule updated"
      redirect_to mall_schedule_path(@mall, @schedule)
    else
      render 'edit'
    end
  end

  def destroy
    Schedule.find(params[:id]).destroy
    flash[:success] = "Schedule destroyed."
    redirect_to schedules_url
  end
end
