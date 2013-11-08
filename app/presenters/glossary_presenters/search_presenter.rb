module GlossaryPresenters

	class SearchPresenter
		attr_reader :data
		include PresenterUtilities

		def initialize(glossary, l1, l2, query)
			@data = Hash.new

			glossary.term_records.where("#{l1} LIKE ?", "%#{query}%").select("#{l1} as source, #{l2} as translation").each do |record|
 					data[record.source] = record.translation
			end

			sort_data!
		end

		def sort_data!
			sorted_record_keys = @data.keys.sort_by { |source_term| remove_accents(source_term).downcase }
			new_record_hash = {}

			sorted_record_keys.each do |source_term|
				new_record_hash = new_record_hash.merge( { source_term => @data[source_term] } )
			end
			@data = new_record_hash
		end

	end
end