module GlossaryPresenters

	class ShowPresenter
		
		include PresenterUtilities
		attr_reader :data

		def initialize(glossary, l1, l2)
			@data = Hash.new({})

			glossary.term_records.select("#{l1} as source, #{l2} as translation").each do |record|
 				first_letter = remove_accents(record.source[0]).upcase

				if %w[1 2 3 4 5 6 7 8 9 0].include?(first_letter)
					@data["#"] = @data["#"].merge( { record.source => record.translation } )
				else
 					@data[first_letter] = @data[first_letter].merge( {record.source => record.translation} )
 				end
			end

			sort_data!
		end

		def sort_data!

			@data.each do |letter, record_hash|
				sorted_record_keys = []
				new_record_hash = {}

				sorted_record_keys = record_hash.keys.sort_by { |key| remove_accents(key).downcase }
				sorted_record_keys.each do |source_term|
					new_record_hash = new_record_hash.merge( { source_term => record_hash[source_term] } )
				end
				@data[letter] = new_record_hash
			end
			@data = Hash[@data.sort]
		end

	end

end