class MySeconedJob
  include Sidekiq::Job

  def perform(project_id, user_id, update_details)
    project = Project.find(project_id)
    user = User.find(user_id)

    # Send email notification with update details
    UserMailer.project_update_notification(user, project, update_details).deliver_now
  end
end