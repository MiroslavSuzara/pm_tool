class Task < ActiveRecord::Base
  validates :title, presence: true, :uniqueness => {scope: :project}
  
  belongs_to :project
  belongs_to :user

  def user_first_name
    user.first_name if user
  end

end
