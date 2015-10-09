class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.integer :exp_month
      t.integer :exp_year
      t.string :cardholder_name

      t.timestamps null: false
    end
  end
end
