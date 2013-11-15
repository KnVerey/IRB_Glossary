class SetCollateForHeroku < ActiveRecord::Migration
  def change
  	ActiveRecord::Base.connection.execute 'ALTER TABLE term_records ALTER COLUMN french TYPE varchar COLLATE "fr_FR";'
  end
end
