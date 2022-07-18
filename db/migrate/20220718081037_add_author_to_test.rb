class AddAuthorToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :author, :integer
    add_foreign_key :tests, :users, column: :author
  end
end
