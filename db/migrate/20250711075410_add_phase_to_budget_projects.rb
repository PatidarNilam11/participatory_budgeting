class AddPhaseToBudgetProjects < ActiveRecord::Migration[8.0]
  def change
    add_reference :budget_projects, :phase, null: false, foreign_key: true
  end
end
