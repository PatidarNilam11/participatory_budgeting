# app/controllers/budget_projects_controller.rb
class BudgetProjectsController < ApplicationController
  def index
    @projects = BudgetProject.includes(:budget_category, :impact_metric).all
  end

  def new
    @project = BudgetProject.new
    @project.build_impact_metric
  end

  def create
    @project = BudgetProject.new(project_params)
    if within_limit?(@project) && @project.save
      redirect_to budget_projects_path, notice: "Project submitted successfully"
    else
      flash[:alert] = "Submission failed. Budget limit exceeded or invalid data."
      render :new
    end
  end

  private

  def project_params
    params.require(:budget_project).permit(:title, :description, :requested_amount, :budget_category_id, :voting_phase_id,
      impact_metric_attributes: [:beneficiaries, :timeline, :sustainability_score])
  end

  def within_limit?(project)
    total_allocated = BudgetProject.where(budget_category: project.budget_category).sum(:requested_amount)
    (total_allocated + project.requested_amount.to_f) <= (project.budget_category.spending_limit_percentage.to_f / 100) * total_budget_pool
  end

  def total_budget_pool
    1000000.0 # You can replace this with a configurable value
  end
end
