class ExamplesController < ApplicationController

  def simple_form
    @client_token = Braintree::ClientToken.generate
  end

  def simple_checkout
    # the nonce we get from braintree, expires in 24 hours
    nonce = params[:payment_method_nonce]

    @result = Braintree::Transaction.sale(
        amount: '100.00',
        payment_method_nonce: nonce
    )
  end

  def custom_form
    @client_token = Braintree::ClientToken.generate
  end

  def custom_checkout
    nonce = params[:payment_method_nonce]
    customer = params[:customer]
    # this is the call that actually creates a record in braintree, the form data is associated with the nonce
    # so just pass the nonce to one of the braintree calls and it will add the form data
    @result = Braintree::Customer.create({payment_method_nonce: nonce}.merge(customer))
  end

end
