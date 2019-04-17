# frozen_string_literal: true

class SourcesController < ApplicationController
  before_action :authorize
  def index
    @sources = Source.all
  end

  def show
    @source =  Source.find(params[:id])
  end

  def new

  end

  def edit

  end

  def create
    @source = authorize Source.new(source_params)
    if @source.save
      redirect_to @source
    else
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

  private

  def source_params
    params.require(:source).permit(:google_id, :name)
  end
end
