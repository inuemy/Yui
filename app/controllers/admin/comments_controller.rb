class Admin::CommentsController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    @comments = @customer.comments.page(params[:page]).order(created_at: :desc)
  end

  def destroy
    comment = Comment.find(params[:id])
    @customer = comment.customer.id
    comment.destroy
    redirect_to admin_admin_comments_path(@customer)
  end
end
