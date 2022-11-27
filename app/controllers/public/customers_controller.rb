class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews.all.limit(3).order(created_at: :desc)
    @comments = @customer.comments.all.limit(4).order(created_at: :desc)
  end

  def edit
    @customer = Customer.find(params[:id])
   unless @customer == current_customer && current_customer.email != "aaa@aaa.com"
    redirect_to public_customer_path(current_customer.id)
   end
  end

  def update
    customer = Customer.find(params[:id])
    if customer != current_customer && current_customer.email == "aaa@aaa.com"
      redirect_to public_customer_path(current_customer.id)
    else
      if customer.update(customer_params)
         redirect_to public_customer_path(current_customer.id)
      else
         render :edit
      end
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    if @customer && current_customer.email != "aaa@aaa.com"
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :sex, :birthday, :prefecture_id, :email, :profile_image, :is_deleted)
  end
end
