class ProgressesController < ApplicationController
  before_action :set_habit_and_date, only: [:destroy]

  def destroy
    @progress = Progress.find_or_initialize_by(habit: @habit, date: @date)
    @progress.destroy
    redirect_to habit_path(@habit), notice: 'Progress was successfully deleted.'
  end

  def create
    @habit = Habit.find(params[:habit_id])
    @progress = @habit.progresses.build(progress_params)
    if @progress.save
      redirect_to habit_path(@habit), notice: 'Progress was successfully created.'
    else
      redirect_to habit_path(@habit), alert: 'Failed to create progress.'
    end
  end

  private

  def progress_params
    params.require(:progress).permit(:date, :completed, :memo)
  end

  def set_habit_and_date
    @habit = Habit.find(params[:habit_id])
    @date = Date.parse(params[:date])
  end
end
