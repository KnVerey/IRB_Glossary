module GlossaryPresenters

	class SearchPresenter
		attr_reader :data

		def initialize(glossary, l1, l2, query)
			@data = Hash.new

			glossary.term_records.where("#{l1} LIKE ?", "%#{query}%").select("#{l1} as source, #{l2} as translation").order("lower(unaccent(#{l1})) ASC").each do |record|
 					data[record.source] = record.translation
			end
		end
	end
end