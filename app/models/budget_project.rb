class BudgetProject < ApplicationRecord
  belongs_to :budget_category
  has_many :votes
  has_one :impact_metric

  def total_votes
    votes.count
  end

  def within_category_limit?
    total_spent = budget_category.budget_projects.sum(:amount)
    limit = (budget_category.spending_limit_percentage.to_f / 100) * BudgetProject.sum(:amount)
    (total_spent + self.amount) <= limit
  end
end
