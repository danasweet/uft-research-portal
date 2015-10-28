class Proposal < ActiveRecord::Base
  belongs_to  :faculty, class_name: :User
  has_many    :comments, as: :commentable
  has_many    :experiments
  has_many :observations

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("department like ?", "%#{query}%")
  end

end
