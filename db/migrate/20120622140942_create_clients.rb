class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :string
 
 

      t.timestamps
    end
  end
end
