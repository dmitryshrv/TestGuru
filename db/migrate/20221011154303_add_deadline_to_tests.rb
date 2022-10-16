class AddDeadlineToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :deadline, :integer
  end
end
