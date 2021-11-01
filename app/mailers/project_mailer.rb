class ProjectMailer < ApplicationMailer

  def new_project(project)
    @project = project
    mail(to: "support@millengo.com", subject: "New project created: #{@project}")


  end

end
