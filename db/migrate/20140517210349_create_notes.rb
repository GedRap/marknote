class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :url
      t.string :title
      t.boolean :public
      t.text :source
      t.text :html
      t.integer :views

      t.timestamps
    end
  end
end
