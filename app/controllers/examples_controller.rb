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

  def deprecated_form
    # test key and key id from documentation
    # 844wfNN5FGuGS7wtKfQsY6k6ZxAv6Ff7
    # 1247307

    orange_braintree_key = '844wfNN5FGuGS7wtKfQsY6k6ZxAv6Ff7'
    @time = Time.now.getutc.strftime('%Y%m%d%H%M%S')
    @hash = Digest::MD5.hexdigest(['', '', @time, orange_braintree_key].join('|'))
  end

  def deprecated_checkout
    # braintree will return these, see documentation for full details
    responsetext = params[:responsetext] # no, not a typo, there is no hyphen
    response_code = params[:response_code]
  end
end
