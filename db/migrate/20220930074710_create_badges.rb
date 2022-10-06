class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :img, null: false
      t.integer :rule, null: false, default: 0
      t.string :rule_value

      t.timestamps
    end
  end
end
