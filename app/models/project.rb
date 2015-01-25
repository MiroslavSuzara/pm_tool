class Project < ActiveRecord::Base

  #validates presence of title
  validates :title, presence: true, uniqueness: true

  validates_presence_of :description, message: "must be present"

end
