# frozen_string_literal: true

class SourcesController < ApplicationController

  def index
    @sources = Source.all
    authorize @sources
  end

  def show
    @source =  Source.find(params[:id])
    authorize @source
  end

  def new
    @source = Source.new
    authorize @source
  end

  def edit
    @source =  Source.find(params[:id])
    authorize @source
  end

  def create
    @source = Source.new(source_params)
    authorize @source
    if @source.save
      redirect_to sources_path
    else
      render 'new'
    end
  end

  def update
    @source =  Source.find(params[:id])
    authorize @source
    if @source.update(source_params)
      redirect_to sources_path
    else
      render 'edit'
    end

  end

  def destroy
    @source =  Source.find(params[:id])
    authorize @source
    @source.destroy
    redirect_to sources_path
  end

  private

  def source_params
    params.require(:source).permit(:google_id, :name)
  end
end
