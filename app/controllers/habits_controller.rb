class HabitsController < ApplicationController
  def index
    @habits = Habit.all
  end

  def new
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
    @habit = Habit.find(params[:id])
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

  def create_progress
    @habit = Habit.find(params[:id])
    @progress = @habit.progresses.build(progress_params)
    if @progress.save
      redirect_to habit_path(@habit), notice: 'Progress was successfully created.'
    else
      redirect_to habit_path(@habit), alert: 'Failed to create progress.'
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:name)
  end

  def progress_params
    params.require(:progress).permit(:date, :completed, :description)
  end
end
