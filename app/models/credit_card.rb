class CreditCard < ActiveRecord::Base
  validates_presence_of :number
  belongs_to :customer
end
