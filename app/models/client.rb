class Client < ActiveRecord::Base
  attr_accessible :birthdate, :firstname, :lastname, :title
  
   has_many :transactions, dependent: :destroy
   
   def self.search(search)
     if search
       find(:all, :conditions => ['firstname LIKE ?', "%#{search}%"])
     else
       find(:all)
     end
   end
end
