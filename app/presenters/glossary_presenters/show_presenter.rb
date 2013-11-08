module GlossaryPresenters

	class ShowPresenter
		def initialize(glossary, l1, l2)
			data = Hash.new({})

			glossary.term_records.select("#{l1} as source, #{l2} as translation").each do |record|
 				first_letter = remove_accents(record.source[0].upcase)

				if %w[1 2 3 4 5 6 7 8 9 0].include?(first_letter)
					data["#"] = data["#"].merge( { record.source => record.translation } )
				else
 					data[first_letter] = data[first_letter].merge( {record.source => record.translation} )
 				end
			end
			return data
		end

		def remove_accents(string)
			string.tr('ÀàÂâÄäÉéÈèÊêËëÎîÏïÔôÖöÛûÜüÙùÇç','aaaaaaeeeeeeeeiiiioooouuuuuucc')
		end

	end

end