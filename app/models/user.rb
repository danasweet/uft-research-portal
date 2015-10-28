class User < ActiveRecord::Base
  has_many  :comments, foreign_key: :commenter_id, as: :commentable
  has_many  :proposals, foreign_key: :faculty_id
  has_many  :experiments, foreign_key: :researcher_id
  has_many :observations, foreign_key: :researcher_id

  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email,:with => /\A([^@\s]+)@((?:uft.)+edu)\z/i
  validates :password, presence: true

  def is_faculty?
    self.role == "faculty" ? true : false
  end

  def is_researcher?
    self.role == "researcher" ? true : false
  end

end

