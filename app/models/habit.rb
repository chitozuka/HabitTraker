class Habit < ApplicationRecord
  has_many :progresses

  def calculate_completed_streak(start_date)
    streak = 0
    current_date = start_date

    while progress_completed_on?(current_date)
      streak += 1
      current_date -= 1.day
    end

    streak
  end

  private
 
  def progress_completed_on?(date)
    progresses.exists?(date: date, completed: true)
  end
end
