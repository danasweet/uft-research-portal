class RemoveObservationsAttr < ActiveRecord::Migration
  def change
    remove_column :experiments, :observations
  end
end
