class Comment < ActiveRecord::Base
  belongs_to  :commenter, class_name: :User
  belongs_to  :proposal
  belongs_to  :experiment
  belongs_to  :commentable, polymorphic: true

  scope :equipment, -> {where(:stage => "Equipment")}
  scope :procedure, -> {where(stage: "Procedure")}
  scope :observations, -> {where(stage: "Observations")}
  scope :results, -> {where(stage: "Results")}
  scope :conclusion, -> {where(stage: "Conclusion")}

end
