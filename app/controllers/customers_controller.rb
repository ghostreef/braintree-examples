class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show

  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created locally. '

      # there's more than one way to do this, I went for adding customer locally then creating in
      # braintree, having both records use same id, you could of course flip this or group the ifs differently
      # the braintree success result also returns the customer

      if params[:add_to_braintree] == '1'
        @result = Braintree::Customer.create(customer_params.merge({id: @customer.id}))
        if @result.success?
          flash[:notice] += 'Customer was successfully created in braintree.'
        else
          flash[:notice] += 'Failed to created in braintree.'
        end
      end

    else
      flash[:error] = 'Failed to create customer.'
      render :new
    end
  end

  def edit

  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      flash[:error] = 'Failed to update customer.'
      render :edit
    end
  end

  def destroy
    if @customer.destroy
      redirect_to :index, notice: 'Customer was successfully destroyed.'
    else
      flash[:error] = 'Failed to destroy customer.'
      redirect_to :index
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :company, :email, :phone, :fax, :website)
  end
end
