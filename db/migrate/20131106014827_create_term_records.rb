class CreateTermRecords < ActiveRecord::Migration
  def change
    create_table :term_records do |t|
      t.string :english
      t.string :french

      t.timestamps
    end
  end
end
