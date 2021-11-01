# Preview all emails at http://localhost:3000/rails/mailers/project_mailer
class ProjectMailerPreview < ActionMailer::Preview

  def new_project
    ProjectMailer.new_project(Project.first).deliver_now
  end

end
