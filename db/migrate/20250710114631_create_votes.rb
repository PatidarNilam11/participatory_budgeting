class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.references :budget_project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
