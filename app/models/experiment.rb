class Experiment < ActiveRecord::Base
  has_many   :comments, as: :commentable
  belongs_to  :researcher, class_name: :User
  belongs_to  :proposal

  def self.current_stage
    #iterate over stage attributes and find last one that isn't nil?
  end
end