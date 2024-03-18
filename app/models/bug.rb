class Bug < ApplicationRecord
belongs_to :user
belongs_to :project
belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'


enum status: { newly: 0, started: 1, completed: 2, resolved: 3 }
  enum bug_type: { feature: 0, bug: 1 }

  validates :title, uniqueness: { scope: :project_id, message: "should be unique within the project" }

  has_one_attached :avatar
  validate :validate_avatar_format
  validates :bug_type, presence: true
  validates :status, presence: true





  


  private

  def validate_avatar_format
    if avatar.attached? && !avatar.content_type.in?(%w(image/png image/gif))
      errors.add(:avatar, 'must be a PNG or GIF image')
    end
  end
  def bug_status_options
    if feature?
      %w(newly started completed)
    elsif bug?
      %w(newly started resolved)
    else
      []
    end
  end

  public
  
  def status_options_for_form
    bug_status_options.map { |status| [status.capitalize, status] }
  end
  

end