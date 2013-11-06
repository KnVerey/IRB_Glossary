class AddGlossaryAssociationToTermRecord < ActiveRecord::Migration
  def change
  	add_column :term_records, :in_glossary, :integer
  end
end
