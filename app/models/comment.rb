class Comment < ActiveRecord::Base
  belongs_to  :commenter, class_name: :User
  belongs_to  :proposal
  belongs_to  :experiment
  belongs_to  :commentable, polymorphic: true
end
