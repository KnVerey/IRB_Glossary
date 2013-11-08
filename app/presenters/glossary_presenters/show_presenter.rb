module GlossaryPresenters

	class ShowPresenter
		attr_reader :data

		def initialize(glossary, l1, l2)
			@data = Hash.new({})

			glossary.term_records.select("#{l1} as source, #{l2} as translation").each do |record|
 				first_letter = remove_accents(record.source[0]).upcase

				if %w[1 2 3 4 5 6 7 8 9 0].include?(first_letter)
					data["#"] = data["#"].merge( { record.source => record.translation } )
				else
 					data[first_letter] = data[first_letter].merge( {record.source => record.translation} )
 				end
			end

			sort_data!
		end

		def remove_accents(string)
			string.tr('ÀàÂâÄäÉéÈèÊêËëÎîÏïÔôÖöÛûÜüÙùÇç','aaaaaaeeeeeeeeiiiioooouuuuuucc')
		end

		def sort_data!
			@data = Hash[(@data.each {|k,v| @data[k] = Hash[v.sort]}).sort]
		end

	end

end