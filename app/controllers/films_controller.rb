class FilmsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
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
    if @film.save
      redirect_to film_path(@film), notice: "映画を投稿しました。"
    else
      flash[:alret] = @film.errors.full_messages
      @film.errors.full_messages
      render :new
    end
  end

  def edit
    @film = Film.find(params[:id])
    @genres = Genre.all
    if @film.user != current_user
      redirect_to films_path, alret: '不正なアクセスです。'
    end 
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
