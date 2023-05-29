require 'rails_helper'

RSpec.describe Progress, type: :model do
  describe 'validations' do
    it 'should validate the uniqueness of progress for the same habit on the same date' do
      habit = FactoryBot.create(:habit)
      FactoryBot.create(:progress, habit: habit, date: '2023-03-04')
      progress = FactoryBot.build(:progress, habit: habit, date: '2023-03-04')
      expect(progress).to be_invalid
    end
  end
end
