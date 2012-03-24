class WorkDocument < ActiveRecord::Base
  belongs_to :work
  
  has_attached_file :patent
  has_attached_file :enrollment
  has_attached_file :cei
  has_attached_file :gifp
  has_attached_file :invoice
  has_attached_file :inss
  has_attached_file :dwell
  has_attached_file :cnd
  has_attached_file :social_contract
  
  before_post_process :transliterate_file_name
  
  def transliterate_file_name
    if !patent_file_name.blank?
      extension = File.extname(patent_file_name).gsub(/^\.+/, '')
      filename = patent_file_name.gsub(/\.#{extension}$/, '')

      filename.downcase!
      filename.gsub!(/'/, '')
      filename.gsub!(/[^A-Za-z0-9]+/, ' ')
      filename.strip!
      filename.gsub!(/\ +/, '-')

      self.patent.instance_write(:file_name, "#{filename}.#{extension}")
    end
    
    if !enrollment_file_name.blank?
      extension = File.extname(enrollment_file_name).gsub(/^\.+/, '')
      filename = enrollment_file_name.gsub(/\.#{extension}$/, '')

      filename.downcase!
      filename.gsub!(/'/, '')
      filename.gsub!(/[^A-Za-z0-9]+/, ' ')
      filename.strip!
      filename.gsub!(/\ +/, '-')

      self.enrollment.instance_write(:file_name, "#{filename}.#{extension}")
    end
  
    if !cei_file_name.blank?
      extension = File.extname(cei_file_name).gsub(/^\.+/, '')
      filename = cei_file_name.gsub(/\.#{extension}$/, '')

      filename.downcase!
      filename.gsub!(/'/, '')
      filename.gsub!(/[^A-Za-z0-9]+/, ' ')
      filename.strip!
      filename.gsub!(/\ +/, '-')

      self.cei.instance_write(:file_name, "#{filename}.#{extension}")
    end
    
    if !gifp_file_name.blank?
      extension = File.extname(gifp_file_name).gsub(/^\.+/, '')
      filename = gifp_file_name.gsub(/\.#{extension}$/, '')

      filename.downcase!
      filename.gsub!(/'/, '')
      filename.gsub!(/[^A-Za-z0-9]+/, ' ')
      filename.strip!
      filename.gsub!(/\ +/, '-')

      self.gifp.instance_write(:file_name, "#{filename}.#{extension}")
    end
    
    if !invoice_file_name.blank?
      extension = File.extname(invoice_file_name).gsub(/^\.+/, '')
      filename = invoice_file_name.gsub(/\.#{extension}$/, '')

      filename.downcase!
      filename.gsub!(/'/, '')
      filename.gsub!(/[^A-Za-z0-9]+/, ' ')
      filename.strip!
      filename.gsub!(/\ +/, '-')

      self.invoice.instance_write(:file_name, "#{filename}.#{extension}")
    end
    
    if !inss_file_name.blank?
      extension = File.extname(inss_file_name).gsub(/^\.+/, '')
      filename = inss_file_name.gsub(/\.#{extension}$/, '')

      filename.downcase!
      filename.gsub!(/'/, '')
      filename.gsub!(/[^A-Za-z0-9]+/, ' ')
      filename.strip!
      filename.gsub!(/\ +/, '-')

      self.inss.instance_write(:file_name, "#{filename}.#{extension}")
    end
    
    if !dwell_file_name.blank?
      extension = File.extname(dwell_file_name).gsub(/^\.+/, '')
      filename = dwell_file_name.gsub(/\.#{extension}$/, '')

      filename.downcase!
      filename.gsub!(/'/, '')
      filename.gsub!(/[^A-Za-z0-9]+/, ' ')
      filename.strip!
      filename.gsub!(/\ +/, '-')

      self.dwell.instance_write(:file_name, "#{filename}.#{extension}")
    end
  
    if !cnd_file_name.blank?
      extension = File.extname(cnd_file_name).gsub(/^\.+/, '')
      filename = cnd_file_name.gsub(/\.#{extension}$/, '')

      filename.downcase!
      filename.gsub!(/'/, '')
      filename.gsub!(/[^A-Za-z0-9]+/, ' ')
      filename.strip!
      filename.gsub!(/\ +/, '-')

      self.cnd.instance_write(:file_name, "#{filename}.#{extension}")
    end
    
    if !social_contract_file_name.blank?
      extension = File.extname(social_contract_file_name).gsub(/^\.+/, '')
      filename = social_contract_file_name.gsub(/\.#{extension}$/, '')

      filename.downcase!
      filename.gsub!(/'/, '')
      filename.gsub!(/[^A-Za-z0-9]+/, ' ')
      filename.strip!
      filename.gsub!(/\ +/, '-')

      self.social_contract.instance_write(:file_name, "#{filename}.#{extension}")
    end
  end
end
