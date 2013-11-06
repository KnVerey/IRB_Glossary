class RenameRecordColumns < ActiveRecord::Migration
  def change
  	rename_column :term_records, :source_term, :english
  	rename_column :term_records, :translation, :french
  end
end
