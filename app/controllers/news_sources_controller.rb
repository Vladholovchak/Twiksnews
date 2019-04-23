# frozen_string_literal: true

class NewsSourcesController < ApplicationController
  def index
    @news_sources = NewsSource.all
    authorize @news_sources
  end

  def show
    @news_source = NewsSource.find(params[:id])
    authorize @news_source
  end

  def new
    @news_source = NewsSource.new
    authorize @news_source
  end

  def edit
    @news_source = NewsSource.find(params[:id])
    authorize @news_source
  end

  def create
    @news_source = NewsSource.new(source_params)
    authorize @news_source
    if @news_source.save
      redirect_to news_sources_path
    else
      render 'new'
    end
  end

  def update
    @news_source = NewsSource.find(params[:id])
    authorize @news_source
    if @news_source.update(news_source_params)
      redirect_to news_source_params
    else
      render 'edit'
    end
  end

  def destroy
    @news_source = NewsSource.find(params[:id])
    authorize @news_source
    @news_source.destroy
    redirect_to news_sources_path
  end

  private

  def news_source_params
    params.require(:news_source).permit(:name)
  end
end
