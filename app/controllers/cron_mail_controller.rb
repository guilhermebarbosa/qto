class CronMailController < ApplicationController
  before_filter :require_no_user
  
  def send_prevision_email
    @works = Work.select("
      id,
      name,
      dwell,
      cnd,
      DATEDIFF(dwell, NOW()) as dwell_dif,
      DATEDIFF(cnd, NOW()) as cnd_dif,
      email_dwell_warning,
      email_dwell,
      email_cnd_warning,
      email_cnd
    ").where("
      (
    		email_dwell_warning = '0'
    	and
    		status_dwell = 'Pendente'
    	and
    		DATEDIFF(dwell, NOW()) <= 10
    	)
    	OR
    	(
    		email_cnd_warning = '0'
    	and
    		status_cnd = 'Pendente'
    	and
    		DATEDIFF(cnd, NOW()) <= 10
    	)
    	OR
    	(
    		email_dwell_warning = '1'
    	and
    		email_dwell = '0'
    	and
    		status_dwell = 'Pendente'
    	and
    		dwell <= NOW()
    	)
    	OR
    	(
    		email_cnd_warning = '1'
    	and
    		email_cnd = '0'
    	and
    		status_cnd = 'Pendente'
    	and
    		cnd <= NOW()
    	)
    ")
    
    @works.each do |work|
      
      @work = Work.find(work.id)
      
      # ENVIA O EMAIL QUANDO O HABITE-SE ESTA SE APROXIMANDO DA DATA DA PREVISÃO
      if work.email_dwell_warning == false
        
        @work.email_dwell_warning = "1"
        WorkMailer.prevision_dwell_warning(work).deliver
      
      # ENVIA O EMAIL QUANDO O HABITE-SE ESTA NA MESMA DATA DA PREVISÃO  
      elsif work.email_dwell_warning == true and work.email_dwell == false
        
        @work.email_dwell = "1"
        WorkMailer.prevision_dwell(work).deliver
      
      # ENVIA O EMAIL QUANDO O CND ESTA SE APROXIMANDO DA DATA DA PREVISÃO
      elsif work.email_dwell_warning == true and work.email_dwell == true and work.email_cnd_warning == false
        
        @work.email_cnd_warning = '1'
        WorkMailer.prevision_cnd_warning(work).deliver
        
      # ENVIA O EMAIL QUANDO O CND ESTA NA MESMA DATA DA PREVISÃO  
      elsif work.email_dwell_warning == true and work.email_dwell == true  and work.email_cnd_warning == true and work.email_cnd == false
        
        @work.email_cnd = '1'
        WorkMailer.prevision_cnd(work).deliver
      
      end
      
      @work.save
      
    end
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
