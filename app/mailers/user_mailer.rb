class UserMailer < ApplicationMailer
  def welcome_email(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: 'projects created')
  end


  def project_update_notification(user, project, update_details)
    @user = user
    @project = project
    @update_details = update_details
    mail(to: @user.email, subject: 'Project Updated Notification')
  end

  def bug_creation_notification(bug, user)
    @bug = bug
    @user = user
    mail(to: @user.email, subject: 'Bug Creation Notification')
  end
end
