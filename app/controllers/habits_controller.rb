class HabitsController < ApplicationController
  def index
    @minus = params[:minus]
    @is_top_page = (@minus.nil? || @minus == false)
    @habits = Habit.all
  end

  def new
    @is_create_habit_page = true
    @habit = Habit.new
  end

  def create
    @habit = Habit.new(habit_params)

    if @habit.save
      redirect_to habits_path, notice: "Habit successfully created."
    else
      render :new
    end
  end

  def show
    @habit = Habit.includes(:progresses).find(params[:id])
    @end_date = Date.today
    @start_date = @end_date - 14
    @progress_records = @habit.progresses.where(date: @start_date..@end_date).index_by(&:date)
    @progress = Progress.new
  end

  def edit
    @habit = Habit.find(params[:id])
  end

  def update
    @habit = Habit.find(params[:id])

    if @habit.update(habit_params)
      redirect_to habits_path, notice: "Habit successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @habit = Habit.find(params[:id])
    @habit.destroy
    redirect_to habits_path, notice: 'Habit was successfully deleted.'
  end

  private

  def habit_params
    params.require(:habit).permit(:name)
  end
end
