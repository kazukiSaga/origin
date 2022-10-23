class FavoritesController < ApplicationController
    def create
        @favorite = current_user.favorites.create(film_id: params[:film_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @film = Film.find(params[:film_id])
        @favorite = current_user.favorites.find_by(film_id: @film.id)
        @favorite.destroy
        redirect_back(fallback_location: root_path)
    end

    def favorite_posts
        @films = Film.Includes(:favorites).where(user_id: current_user.id)
    end
end
