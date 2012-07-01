class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :client_id
      t.string :transactionType
      t.date :date
      t.string :location
      t.decimal :price

      t.timestamps
    end
  end
end
