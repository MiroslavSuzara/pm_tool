class Project < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates_presence_of :description, message: "must be present"

  belongs_to :user

  #dependent: :destroy makes it such that associated records are also destroyed when the owner is destroyed
  has_many :tasks, dependent: :destroy
  has_many :discussions, dependent: :destroy

  def user_first_name
    user.first_name if user
  end
  
end
