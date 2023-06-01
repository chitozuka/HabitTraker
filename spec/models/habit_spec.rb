require 'rails_helper'

RSpec.describe Habit, type: :model do
  describe "#destroy" do
    it "delete child processes" do
      habit = FactoryBot.create(:habit)
      habit2 = FactoryBot.create(:habit)
      FactoryBot.create(:progress, habit: habit, date: '2023-03-04')
      FactoryBot.create(:progress, habit: habit, date: '2023-03-05')
      FactoryBot.create(:progress, habit: habit2, date: '2023-03-05')

      expect {
        habit.destroy
      }.to change(Progress, :count).by(-2)
    end
  end
end
