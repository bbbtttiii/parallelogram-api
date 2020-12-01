class Api::V1::FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :update, :destroy]

  # GET /favorites
  def index
    @favorites = Favorite.all
    render json: FavoriteSerializer.new(@favorites)
  end

  # GET /favorite/1
  def show
    @favorite = Favorite.find(params[:id])
    render json: @favorite
  end

  # POST /favorites
  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      favorite[:article_id] = @article.id
      render json: FavoriteSerializer.new(@favorite), status: :created
    else
      render json: @favorite.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorite/1
  def update
    @favorite = Favorite.where(article: Article.find(params[:article_id]), user: current_user)
    if @favorite == []
      Favorite.create(article: Article.find(params[:article_id], user: current_user))
      @favorite_exists = true
    else
      @favorite.destroy
      @favorite_exists = false
    end
  end

  # def update
  #   if @favorite.update(favorite_params)
  #     render json: @favorite
  #   else
  #     render json: @favorite.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /favorite/1
  def destroy
    @favorite.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :article_id)
    end
end