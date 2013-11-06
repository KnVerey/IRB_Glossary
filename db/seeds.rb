# This file should contain all the line creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_data = CSV.read("irb_glossary.csv")

csv_data.each do |line| 
	@term_record = TermRecord.create( english: line[0], french: line[1] )
end