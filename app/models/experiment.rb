class Experiment < ActiveRecord::Base
  has_many    :comments, as: :commentable
  belongs_to  :researcher, class_name: :User
  belongs_to  :proposal
end
