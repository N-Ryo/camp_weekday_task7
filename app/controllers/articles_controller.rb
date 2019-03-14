class ArticlesController < ApplicationController
  # @article に値を格納するコードのリファクタリング
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    # ストロングパラメータを定義
    def article_params
      params.require(:article).permit(:title, :body)
    end
    # URIからidを使い、Articleモデルから1つ値を格納
    def set_article
      @article = Article.find(params[:id])
    end
end
