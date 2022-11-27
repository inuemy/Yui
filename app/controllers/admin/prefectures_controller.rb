class Admin::PrefecturesController < ApplicationController
  def new
    @prefecture = Prefecture.new
    @prefectures = Prefecture.all
  end

  def create
    prefecture = Prefecture.new(prefecture_params)
    prefecture.save
    redirect_to new_admin_prefecture_path
  end

  def edit
    @prefecture = Prefecture.find(params[:id])
  end

  def update
    prefecture = Prefecture.find(params[:id])
    prefecture.update(prefecture_params)
    redirect_to new_admin_prefecture_path
  end

  def destroy
    prefecture = Prefecture.find(params[:id])
    prefecture.destroy
    redirect_to new_admin_prefecture_path
  end

  private
  def prefecture_params
    params.require(:prefecture).permit(:prefecture)
  end
end
