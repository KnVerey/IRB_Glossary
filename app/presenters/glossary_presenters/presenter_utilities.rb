module PresenterUtilities

	def remove_accents(string)
		string.tr('ÀàÂâÄäÉéÈèÊêËëÎîÏïÔôÖöÛûÜüÙùÇç','aaaaaaeeeeeeeeiiiioooouuuuuucc')
	end
end