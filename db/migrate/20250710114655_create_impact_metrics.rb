class CreateImpactMetrics < ActiveRecord::Migration[8.0]
  def change
    create_table :impact_metrics do |t|
      t.references :budget_project, null: false, foreign_key: true
      t.integer :estimated_beneficiaries
      t.string :timeline
      t.integer :sustainability_score

      t.timestamps
    end
  end
end
