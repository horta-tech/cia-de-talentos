class CustomersController < ApplicationController
  def index
    @customers = policy_scope(Customer)
    authorize @customers
  end

  def new
    @customer = Customer.new
    authorize @customer
  end

  def create
    @customer = Customer.new(customer_params)
    authorize @customer
    @customer.save
    redirect_to customers_path
  end

  def edit
    @photo = Photo.new
    @customer = Customer.find(params[:id])
    authorize @customer
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render :edit
    end
    authorize @customer
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    authorize @customer
    redirect_to customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :insta_text, :fb_url, :insta_url, :site_url, :logo)
  end

end
