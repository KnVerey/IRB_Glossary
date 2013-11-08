class CreateTermRecords < ActiveRecord::Migration
  def change
    create_table :term_records do |t|
      t.text :english
      t.text :french
      t.integer :glossary_id

      t.timestamps
    end
  end
end
