# frozen_string_literal: true

# class NewsFetchersController < ApplicationController
#   def fetch_news
#     authorize User
#     UpdateNewsJob.set(wait: 10.seconds).perform_later
#     redirect_to root_path
#     flash[:success] = 'Articles will be updated after 10 seconds!'
#   end
#
#   def fetch_sources
#     authorize User
#     UpdateSourcesJob.set(wait: 10.seconds).perform_later
#     redirect_to root_path
#     flash[:success] = 'Sources will be updated after 10 seconds!'
#   end
#
#   def user_params
#     params.require(@user).permit(:id)
#   end
# end
