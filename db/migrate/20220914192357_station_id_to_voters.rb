class StationIdToVoters < ActiveRecord::Migration[6.1]
  def change
    
    add_column :voters, :station_id, :integer, null: false

  end
end
