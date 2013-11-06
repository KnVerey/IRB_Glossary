class TermRecordsController < ApplicationController

	def index
	end

	def show
		@term_records = TermRecord.all
		@l1 = "English"
		@l2 = "French"
	end
end
