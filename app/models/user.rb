class User < ActiveRecord::Base
  has_many  :comments, foreign_key: :commenter_id, as: :commentable
  has_many  :proposals, foreign_key: :faculty_id
  has_many  :experiments, foreign_key: :researcher_id

  has_secure_password
end
