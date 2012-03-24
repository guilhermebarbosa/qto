class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :works, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :assignments
  has_many :roles, :through => :assignments
  
  validates :role_ids, :presence => true
  
  def role_symbols
    roles.map do |role|
      role.name.underscore.to_sym
    end
  end
end