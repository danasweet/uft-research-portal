# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = 

[User.create!(:name => "Dr. Hyde", :email => "hyde@uft.edu", :password => "password", :role => "faculty"),
User.create!(:name => "Dr. Jekyll", :email => "jekyll@uft.edu", :password => "password", :role => "faculty")]



proposal1 = Proposal.create!(:title => "Awesome Proposal", 
  :summary => "This is the summary for my awesome proposal", 
  :hypothesis => "I hypothesize that all of the experiments for my proposal will be awesome.", 
  :department => "Frigging Science", 
  :active => 1 , :faculty => users.sample)


proposal2 = Proposal.create!(:title => "Another awesome Proposal", 
  :summary => "This is the summary for my awesome proposal that is more awesome than yours", 
  :hypothesis => "I hypothesize that all of the experiments for my proposal will be awesome as well.", 
  :department => "Biology", 
  :active => 1 , 
  :faculty => users.sample)