class RenameInGlossaryColumn < ActiveRecord::Migration
  def change
  	rename_column :term_records, :in_glossary, :glossary_id
  end
end
