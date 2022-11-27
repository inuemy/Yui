class Admin::ReviewsController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews.page(params[:page]).order(created_at: :desc)
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    customer = review.customer
    redirect_to admin_admin_reviews_path(customer.id)
  end

end
