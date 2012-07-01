class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.string :title

      t.timestamps
    end
  end
end
