class Habit < ApplicationRecord
  has_many :progresses, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def get_progress_records(start_date, end_date)
    progress_records = progresses.where(date: start_date..end_date)
    .pluck(:date, :completed)
    .to_h
    progress_records.default = false # 存在しない日付のデフォルト値を設定
    progress_records
  end

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
