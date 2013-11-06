class TermRecordsController < ApplicationController

	def index
		@term_records = TermRecord.all
	end
end
