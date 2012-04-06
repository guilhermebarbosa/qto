class Work < ActiveRecord::Base
  belongs_to :state
  belongs_to :city
  belongs_to :company
  belongs_to :user
  
  attr_accessor :current_user
  
  has_many :work_documents, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  accepts_nested_attributes_for :work_documents, :allow_destroy => true
  
  Entry = ["Aferição", "Contabilidade"]
  STATUS_DWELL = ["Pendente", "Entregue"]
  STATUS_CND = ["Pendente", "Entregue"]

  before_validation :update_prevision_cnd, :update_prevision_email
  
  private
    def update_prevision_email
      if !self.id.blank?
        @work_last = Work.find(self.id)
        if !self.dwell.blank? and @work_last.dwell != self.dwell
          self.email_dwell_warning = "0"
          self.email_dwell = "0"
          self.email_cnd_warning = "0"
          self.email_cnd = "0"
        end
      end
    end
    def update_prevision_cnd
      if !self.dwell.blank?
        self.cnd = self.dwell + 1.months
      else
        self.cnd = self.dwell
      end
    end

  validates :name, :address, :number, :district, :cep, :state, :city, :date_initial, :territorial, :cost_center, :footage, :company_id, :responsible, :user_id, :status, :entry, :issue_date, :contact_name, :contact_telephone, :presence => true
  validates :contact_email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  validates :demolition_type, :demolition_km, :presence => true, :if => Proc.new {|c| not c.demolition_check.blank? }
  validates :floor_qtd, :floor_qtd_km, :floor_units, :floor_units_km, :floor_bathroom, :floor_bathroom_km, :presence => true, :if => Proc.new {|c| not c.floor_check.blank? }
  validates :home_club, :home_club_km, :home_ordinance, :home_ordinance_km, :home_support_ordinance, :home_support_ordinance_km, :presence => true, :if => Proc.new {|c| not c.home_check.blank? }
end