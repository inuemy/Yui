class ApplicationController < ActionController::Base
  before_action :set_search

 def set_search
  @search = Review.ransack(params[:q])
  @search_reviews = @search.result.page(params[:page])
 end
end
