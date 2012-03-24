class Work < ActiveRecord::Base
  belongs_to :state
  belongs_to :city
  belongs_to :company
  belongs_to :user
  
  has_many :work_documents, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  accepts_nested_attributes_for :work_documents, :allow_destroy => true
  
  Entry = ["Aferição", "Contabilidade"]

  validates :name, :address, :number, :district, :cep, :state, :city, :date_initial, :territorial, :cost_center, :footage, :company_id, :responsible, :user_id, :status, :entry, :issue_date, :contact_name, :contact_telephone, :presence => true
  validates :contact_email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :demolition_type, :demolition_km, :presence => true, :if => Proc.new {|c| not c.demolition_check.blank? }
  validates :floor_qtd, :floor_units, :floor_bathroom, :presence => true, :if => Proc.new {|c| not c.floor_check.blank? }
  validates :home_club, :home_ordinance, :home_support_ordinance, :presence => true, :if => Proc.new {|c| not c.home_check.blank? }
end