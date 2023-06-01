class AddMemoToProgresses < ActiveRecord::Migration[7.0]
  def change
    add_column :progresses, :memo, :string
  end
end
