class VotesController < ApplicationController
  before_action :find_movie
  before_action :authenticate_user!
  before_action :find_vote, only: [:destroy]

  def create
    if already_voted?
      flash[:notice] = "You can't vote more than once"
    else
      if params[:vote_type] == "0"
        @movie.votes.create(user_id: current_user.id, vote_type: 0)
        @movie.update(number_of_likes: @movie.number_of_likes + 1)
      else
        @movie.votes.create(user_id: current_user.id, vote_type: 1)
        @movie.update(number_of_hates: @movie.number_of_hates + 1)
      end
    end
    respond_to do |format|
      format.js { render layout: false, template: "votes/reload_votes" }
    end
  end

  def destroy
    if !(already_voted?)
      flash[:notice] = "Cannot unvote"
    else
      @vote.destroy
      params[:vote_type] == "0" ? @movie.update(number_of_likes: @movie.number_of_likes - 1) : @movie.update(number_of_hates: @movie.number_of_hates - 1)
    end
    respond_to do |format|
      format.js { render layout: false, template: "votes/reload_votes" }
    end
  end

  private
  def find_movie
    @movie = Movie.find(params[:movie_id])
  end

  def find_vote
    @vote = @movie.votes.find(params[:id])
  end

  def already_voted?
    Vote.where(user_id: current_user.id, movie_id: params[:movie_id]).exists?
  end
end