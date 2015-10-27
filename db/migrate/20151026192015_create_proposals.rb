class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :summary
      t.string :hypothesis
      t.string :department
      t.integer :active 
      t.integer :faculty_id
      t.timestamps
    end
  end
end
