class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #if user is deleted, project is destroyed
  has_many :projects, dependent: :destroy

  #if user is deleted, task is destroyed
  has_many :tasks, dependent: :destroy

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze.strip
    else
      email
    end
  end
  
end
