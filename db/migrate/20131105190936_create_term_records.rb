class CreateTermRecords < ActiveRecord::Migration
  def change
    create_table :term_records do |t|
      t.string :source_term
      t.string :translation

      t.timestamps
    end
  end
end
