module GlossariesHelper


	def remove_accents(word)
		word.tr('ÀàÂâÄäÉéÈèÊêËëÎîÏïÔôÖöÛûÜüÙùÇç','aaaaaaeeeeeeeeiiiioooouuuuuucc')
	end

	def chapter_list(glossary, index_lang)
		all_char1s = glossary.term_records.map do |record|
			if index_lang == "english"
				source_term = record.english
				translation = record.french
			else
				source_term = record.french
				translation = record.english
			end

			term_char1 = remove_accents source_term[0]
			%w[1 2 3 4 5 6 7 8 9 0].include?(term_char1) ? "#" : term_char1.upcase
		end

		all_char1s.uniq.sort
	end

end