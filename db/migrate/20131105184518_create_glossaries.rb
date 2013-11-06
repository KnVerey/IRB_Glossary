class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
      t.string :description
      t.string :source

      t.timestamps
    end
  end
end
