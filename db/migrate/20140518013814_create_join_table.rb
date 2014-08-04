class CreateJoinTable < ActiveRecord::Migration
  def change
  	create_table :tags_notes, :id => false do |t|
      t.integer :tag_id
      t.integer :note_id
    end
  end
end
