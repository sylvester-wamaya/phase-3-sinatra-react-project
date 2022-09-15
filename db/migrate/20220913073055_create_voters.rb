class CreateVoters < ActiveRecord::Migration[6.1]
  def change
    create_table :voters do |t|
  
    t.string :name

  end
  end
end
