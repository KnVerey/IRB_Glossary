# This file should contain all the line creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

def populate(glossary_id)
	csv_data = CSV.read("irb_glossary.csv")

	if glossary_id==2 
	 	source_lang_term = 1; trans_term = 0
	else
		source_lang_term = 0; trans_term = 1
	end

		csv_data.each do |line| 
			@term_record = TermRecord.create( source_term: line[source_lang_term], translation: line[trans_term], glossary_id: glossary_id )
		end
end

@glossary = Glossary.create(description: 'IRB Glossary: English to French', source: 'http://www.irb-cisr.gc.ca/Eng/BoaCom/pubs/Pages/GloLexAk.aspx' )
populate(1)

@glossary = Glossary.create(description: 'IRB Glossary: French to English', source: 'http://www.irb-cisr.gc.ca/Fra/BoaCom/pubs/Pages/GloLexAk.aspx' )
populate(2)