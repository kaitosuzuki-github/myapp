class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(post_params)
    if @schedule.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :schedules
    else
      flash.now[:notice] = "スケジュールを登録できませんでした"
      render action: :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(post_params)
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      flash.now[:notice] = "スケジュールを更新できませんでした"
      render action: :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :schedules
  end

  private

  def post_params
    params.require(:schedule).permit(:title, :startday, :endday, :allday, :text)
  end
end
