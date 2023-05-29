class Progress < ApplicationRecord
  belongs_to :habit
  validate :check_duplicate_progress, on: :create

  private

  def check_duplicate_progress
    if Progress.exists?(habit_id: habit_id, date: date)
      errors.add(:base, 'Progress for the same habit and date already exists')
    end
  end
end
