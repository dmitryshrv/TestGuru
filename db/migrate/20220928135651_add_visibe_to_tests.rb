class AddVisibeToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :visible, :boolean, default: false
    add_index :tests, :visible
  end
end
