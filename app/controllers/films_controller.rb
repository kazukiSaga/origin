class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
    @film = Film.find(params[:id])
  end

  def new
    @film = Film.new
    @genres = Genre.all
  end

  def create
    @film = Film.new(film_params)
    @film.user_id = current_user.id
    @film.genre_id = params[:genre][:id]
    @film.save!
    redirect_to film_path(@film)
  end

  def edit
    @film = Film.find(params[:id])
    @genres = Genre.all
  end

  def update
    @film = Film.find(params[:id])
    @film.update(film_params)
    redirect_to film_path(@film)
  end

  private
  def film_params
    params.require(:film).permit(:title, :story, :filmdirector, :origin, :releasedate, :country, :starring, :name, :genre_id)
  end
end
