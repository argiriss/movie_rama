class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit destroy ]
  before_action :authenticate_user!, only: %i[ new create destroy ]

  def index
    @movies = Movie.all
    @movies = @movies.order(params[:sort]) if params[:sort].present?
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_url, notice: "Movie was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :number_of_likes, :number_of_hates, :user_id)
    end
end
