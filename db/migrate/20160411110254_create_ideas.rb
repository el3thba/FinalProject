class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :overview
      t.string :skills
      t.string :additional_information
      t.string :platform
      t.string :help_needed

      t.timestamps null: false
    end
  end
end
