class CreateMissions < ActiveRecord::Migration
  def self.up
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.integer :syllabus_id

      t.timestamps
    end
  end

  def self.down
    drop_table :missions
  end
end
