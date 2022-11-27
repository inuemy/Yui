class Public::HomeController < ApplicationController
  def top
    @prefectures = Prefecture.all
    if params[:prefecture_id] == nil
     @reviews = Review.page(params[:page]).limit(6).order(created_at: :desc)
    else
     @reviews = Review.where(prefecture_id: params[:prefecture_id]).page(params[:page]).limit(6).order(created_at: :desc)
    end
  end
end
