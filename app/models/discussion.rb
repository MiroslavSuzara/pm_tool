class Discussion < ActiveRecord::Base
  belongs_to :project
  
  validates :title, presence: true

  has_many :comments, dependent: :destroy

end
