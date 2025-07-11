# app/controllers/votes_controller.rb
class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    if current_phase_allows_vote? && @vote.save
      redirect_to budget_projects_path, notice: "Vote submitted."
    else
      redirect_to budget_projects_path, alert: "Voting is not allowed right now."
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:budget_project_id, :voter_id)
  end

  def current_phase_allows_vote?
    VotingPhase.current.exists?
  end
end
