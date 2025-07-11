class Phase < ApplicationRecord
   has_many :budget_projects

  scope :current, -> {
    where(active: true).where("starts_at <= ? AND ends_at >= ?", Time.current, Time.current)
  }
end
