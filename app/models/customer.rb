class Customer < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :phone
  validates_format_of :website, with: /www\..+\..+/, message: 'invalid url'

  after_initialize :set_defaults, unless: :persisted?

  has_many :credit_cards

  accepts_nested_attributes_for :credit_cards, allow_destroy: true

  def set_defaults
    self.braintree_sync ||= false
  end
end
