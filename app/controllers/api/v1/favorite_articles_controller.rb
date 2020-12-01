class Api::V1::FavoriteArticlesController < ApplicationController
  before_action :set_favorite, only: [:show, :update, :destroy]

  # GET /favorite_articles
  def index
    @favorite_articles = FavoriteArticle.all
    render json: FavoriteArticleSerializer.new(@favorite_articles)
  end

  # GET /favorite_articles/1
  def show
    @favorite_article = FavoriteArticle.find(params[:id])
    render json: @favorite_article
  end

  # POST /favorite_articles
  def create
    @favorite_article = FavoriteArticle.new(favorite_article_params)
    if @favorite_article.save
      favorite_article[:article_id] = @article.id
      render json: FavoriteArticleSerializer.new(@favorite_article), status: :created
    else
      render json: @favorite_article.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorite_articles/1
    def update
      @favorite_article = Favorite_article.where(article: Article.find(params[:article_id]), user: current_user)
      if @favorite_article == []
        Favorite_article.create(article: Article.find(params[:article_id], user: current_user))
        @favorite_article_exists = true
      else
        @favorite_article.destroy
        @favorite_article_exists = false
      end
    end





  # def update
  #   if @favorite_article.update(favorite_article_params)
  #     render json: @favorite_article
  #   else
  #     render json: @favorite_article.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /favorite_articles/1
  def destroy
    @favorite_article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_article
      @favorite_article = FavoriteArticle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorite_article_params
      params.require(:favorite_article).permit(:user_id, :article_id)
    end
end
