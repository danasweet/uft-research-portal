class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :stage
      t.integer :commenter_id
      t.integer :experiment_id
      t.integer :proposal_id
      t.references :commentable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
