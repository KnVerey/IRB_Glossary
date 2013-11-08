class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
      t.text :description
      t.text :source

      t.timestamps
    end
  end
end
