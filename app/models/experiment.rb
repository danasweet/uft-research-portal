class Experiment < ActiveRecord::Base
  has_many    :comments, as: :commentable
  has_many :observations, foreign_key: :experiment_id
  belongs_to  :researcher, class_name: :User
  belongs_to  :proposal

  def current_stage
    if self.equipment == nil
      "equipment"
    elsif self.procedure == nil
      "procedure"
    elsif self.observations == nil
      "observations"
    elsif self.results == nil
      "results"
    else
      "conclusion"
    end
  end

end
