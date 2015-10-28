class AddProposalIdToObs < ActiveRecord::Migration
  def change
      add_column :observations, :proposal_id, :integer

  end
end
