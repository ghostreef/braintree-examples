class Customer < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email, :phone
  validates_format_of :website, with: /www\..+\..+/, message: 'invalid url'
end
