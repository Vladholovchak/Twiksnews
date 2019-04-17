# frozen_string_literal: true

class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @articles = authorize Article.all
    @articles = current_user.articles if current_user.present?
    @articles = @articles.order(published_at: :desc)
    @articles = @articles.paginate(:page => params[:page],:per_page => 8)
  end

  def show
    @article = Article.find(params[:id])
    authorize(@article)
  end

  def new
    @article = authorize Article.new
  end

  def edit
    @article = authorize Article.find(params[:id])
  end

  def create
    @article = authorize Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = authorize Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = authorize Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:source_id, :title, :description, :url, :url_to_image,
    :published_at)
  end

end
