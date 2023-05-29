class ProgressesController < ApplicationController
  def destroy
    @habit = Habit.find(params[:habit_id])
    @progress = @habit.progresses.find(params[:id])
    @progress.destroy
    redirect_to habit_path(@habit), notice: 'Progress was successfully deleted.'
  end
end
