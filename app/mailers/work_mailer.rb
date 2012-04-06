class WorkMailer < ActionMailer::Base
  default :from => "qto.obras@gmail.com"
  
  def prevision_dwell_warning(work)
    @work = work
    
    attachments["qto.png"] = File.read("#{Rails.root}/app/assets/images/qto.png")
    mail(:to => "qto.obras@gmail.com", :subject => "Previsão do Habite-se se Aproximando")
  end
  
  def prevision_dwell(work)
    @work = work
    
    attachments["qto.png"] = File.read("#{Rails.root}/app/assets/images/qto.png")
    mail(:to => "qto.obras@gmail.com", :subject => "Previsão do Habite-se Prazo Máximo")
  end
  
  def prevision_cnd_warning(work)
    @work = work
    
    attachments["qto.png"] = File.read("#{Rails.root}/app/assets/images/qto.png")
    mail(:to => "qto.obras@gmail.com", :subject => "Previsão do CND se Aproximando")
  end
  
  def prevision_cnd(work)
    @work = work
    
    attachments["qto.png"] = File.read("#{Rails.root}/app/assets/images/qto.png")
    mail(:to => "qto.obras@gmail.com", :subject => "Previsão do CND Prazo Máximo")
  end
  
  def new_work_alert(work)
    @work = work
    
    attachments["qto.png"] = File.read("#{Rails.root}/app/assets/images/qto.png")
    mail(:to => "qto.obras@gmail.com", :subject => "Nova obra")
  end
  
  def new_comment_alert(comment)
    @comment = comment
    
    attachments["qto.png"] = File.read("#{Rails.root}/app/assets/images/qto.png")
    mail(:to => "qto.obras@gmail.com", :subject => "Novo Comentario")
  end
  
  def edit_comment_alert(comment, last_comment)
    @comment = comment
    @last_comment = last_comment
    
    attachments["qto.png"] = File.read("#{Rails.root}/app/assets/images/qto.png")
    mail(:to => "qto.obras@gmail.com", :subject => "Alterou um Comentario")
  end
end