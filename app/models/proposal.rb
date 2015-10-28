class Proposal < ActiveRecord::Base
  belongs_to  :faculty, class_name: :User
  has_many    :comments, as: :commentable
  has_many    :experiments
  has_many :observations
end
