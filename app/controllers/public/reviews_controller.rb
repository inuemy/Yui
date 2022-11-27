class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.customer == current_customer && current_customer.email != "aaa@aaa.com"
     if @review.save
       redirect_to public_review_path(@review.id)
     else
       render :new
     end
    end
  end

  def index
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews.page(params[:page]).order(created_at: :desc)
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = @review.comments.all.order(created_at: :desc)
  end

  def edit
    @review = Review.find(params[:id])
   unless @review.customer == current_customer && current_customer.email != "aaa@aaa.com"
    redirect_to public_review_path(@review.id)
   end
  end

  def update
    review = Review.find(params[:id])
    if review.customer != current_customer && current_customer.email == "aaa@aaa.com"
     redirect_to public_review_path(review.id)
    else
      if params[:review][:image_ids]
        params[:review][:image_ids].each do |image_id|
         image = review.images.find(image_id)
         image.purge
        end
      end
      if review.update(review_params)
         redirect_to public_review_path(review.id)
      else
         render :edit
      end
    end
  end

  def destroy
    review = Review.find(params[:id])
    if review.customer != current_customer && current_customer.email == "aaa@aaa.com"
       redirect_to public_review_path(review.id)
    else
       review.destroy
       redirect_to public_public_reviews_path(current_customer.id)
    end
  end

  def venue_search
    @reviews = Review.looks(params[:keyword])
  end

  private
  def review_params
   params.require(:review).permit(:customer_id, :venue, :chapel, :reception, :food, :staff, :access, :comment, :prefecture_id, images: [])
  end

end