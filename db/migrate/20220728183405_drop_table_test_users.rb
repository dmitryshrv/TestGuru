class DropTableTestUsers < ActiveRecord::Migration[6.1]
  def change
    def up
      drop_table :user_tests, if_exists: true
    end

    def down
    end
  end
end
