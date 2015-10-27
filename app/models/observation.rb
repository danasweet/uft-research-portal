class Observation < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :researcher, class_name: :user
  has_many  :comments, foreign_key: :commenter_id, as: :commentable
end
