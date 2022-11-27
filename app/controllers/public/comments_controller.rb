class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.customer == current_customer && current_customer.email != "aaa@aaa.com"
    @comment.save
    else
    redirect_to root_path
    end
    @review = @comment.review
    redirect_to public_review_path(@review.id)
  end

  def index
    @customer = Customer.find(params[:id])
    @comments = @customer.comments.page(params[:page]).order(created_at: :desc)
  end

  def edit
    @comment = Comment.find(params[:id])
   unless @comment.customer == current_customer && current_customer.email != "aaa@aaa.com"
    redirect_to public_public_comments_path(@comment.customer.id)
   end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.customer != current_customer && current_customer.email == "aaa@aaa.com"
     redirect_to public_public_comments_path(comment.id)
    else
      if comment.update(comment_params)
         redirect_to public_public_comments_path(current_customer.id)
      else
         render :edit
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    @customer = comment.customer
   if comment.customer != current_customer && current_customer.email == "aaa@aaa.com"
      redirect_to public_public_comments_path(@customer.id)
   else
      comment.destroy
      redirect_to public_public_comments_path(@customer.id)
   end
  end

  private
  def comment_params
   params.require(:comment).permit(:customer_id, :review_id, :comment)
  end
end
