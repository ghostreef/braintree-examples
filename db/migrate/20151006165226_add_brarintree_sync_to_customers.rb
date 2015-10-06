class AddBrarintreeSyncToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :braintree_sync, :boolean
  end
end
