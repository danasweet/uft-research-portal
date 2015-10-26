class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :description
      t.string :equipment
      t.string :procedure
      t.string :observations
      t.string :results
      t.string :conclusion
      t.integer :researcher_id
      t.integer :proposal_id
      t.timestamps
    end
  end
end