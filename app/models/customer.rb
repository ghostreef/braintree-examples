class Customer < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :phone
  validates_format_of :website, with: /www\..+\..+/, message: 'invalid url'

  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.braintree_sync ||= false
  end
end
