class WorkMailer < ActionMailer::Base
  default :from => "qto.obras@gmail.com"
  
  def new_work_alert(work)
    @work = work
    
    attachments["qto.png"] = File.read("#{Rails.root}/app/assets/images/qto.png")
    mail(:to => "qto.obras@gmail.com", :subject => "Nova obra")
  end
end