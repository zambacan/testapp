class Transaction < ActiveRecord::Base
  attr_accessible :client_id, :date, :location, :price, :transactionType
  belongs_to :client
end
