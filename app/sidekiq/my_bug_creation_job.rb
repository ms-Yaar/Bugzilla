
class MyBugCreationJob
  include Sidekiq::Worker

  def perform(bug_id, user_id)
    bug = Bug.find(bug_id)
    user = User.find_by(id: user_id)
    if user
      UserMailer.bug_creation_notification(bug, user).deliver_now
    else
      Rails.logger.error("User with ID #{user_id} not found.")
    end
  end
  end
  
  

  
    