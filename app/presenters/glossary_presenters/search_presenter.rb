module GlossaryPresenters

	class SearchPresenter
		attr_reader :data

		def initialize(glossary, l1, l2, query)
			@data = Hash.new

			glossary.term_records.where("#{l1} LIKE ?", "%#{query}%").select("#{l1} as source, #{l2} as translation").each do |record|
 					data[record.source] = record.translation
			end

			sort_data!
		end

		def sort_data!
			@data.each do |source_term, translation|
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