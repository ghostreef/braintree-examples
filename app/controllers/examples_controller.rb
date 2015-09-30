class ExamplesController < ApplicationController
  def simple_form
    @client_token = Braintree::ClientToken.generate
  end

  def simple_checkout
    nonce = params[:payment_method_nonce]
    @result = Braintree::Transaction.sale(
        :amount => "100.00",
        :payment_method_nonce => nonce
    )
  end
end
