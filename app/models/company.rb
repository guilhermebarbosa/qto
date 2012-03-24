class Company < ActiveRecord::Base
  has_many :works, :dependent => :destroy
  
  validates :name, :cnpj, :presence => true
end
