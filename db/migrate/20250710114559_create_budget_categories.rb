class CreateBudgetCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :budget_categories do |t|
      t.string :name
      t.integer :spending_limit_percentage

      t.timestamps
    end
  end
end
