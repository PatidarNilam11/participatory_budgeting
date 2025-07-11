class BudgetCategory < ApplicationRecord
  has_many :budget_projects

  validates :spending_limit_percentage, numericality: { less_than_or_equal_to: 100 }
end
