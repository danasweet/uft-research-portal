class AddTitleToExperiments < ActiveRecord::Migration
  def change
    add_column :experiments, :title,:string
  end
end
