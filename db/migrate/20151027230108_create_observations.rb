conclass CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :content
      t.integer :researcher_id
      t.integer :experiment_id
      t.timestamps
    end
  end
end
