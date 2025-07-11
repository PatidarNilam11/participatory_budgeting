class CreateBudgetProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :budget_projects do |t|
      t.string :title
      t.text :description
      t.decimal :amount
      t.references :budget_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
