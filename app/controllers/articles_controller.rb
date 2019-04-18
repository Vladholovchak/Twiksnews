# frozen_string_literal: true

class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @articles = authorize Article.all
    @articles = current_user.articles if current_user.present?
    @articles = @articles.order(published_at: :desc)
    @articles = @articles.paginate(:page => params[:page],:per_page => 5)
  end

  def show
    @article = Article.find(params[:id])
    authorize @article
  end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def create
    @article = Article.new(article_params)
    authorize @article
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    authorize @article
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:source_id, :title, :description, :url, :url_to_image,
    :published_at)
  end

end
