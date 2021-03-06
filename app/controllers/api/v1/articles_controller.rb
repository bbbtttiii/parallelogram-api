class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all
    render json: ArticleSerializer.new(@articles)
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
    render json: ArticleSerializer.new(@article)
    @favorite_exists = Favorite.where(article: @article, user: current_user) == [] ? false : true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :content, :tag, :author, :summary, :favorite_count, :image_url)
    end
end