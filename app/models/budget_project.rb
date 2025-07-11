# app/models/budget_project.rb
class BudgetProject < ApplicationRecord
  belongs_to :budget_category
  belongs_to :phase
  has_one :impact_metric, dependent: :destroy
  has_many :votes

  accepts_nested_attributes_for :impact_metric

  validates :title, :description, :requested_amount, presence: true
end
