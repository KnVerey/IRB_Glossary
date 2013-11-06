class GlossariesController < ApplicationController

	def index
		@glossaries = Glossary.all
	end

	def show
		@glossary = Glossary.find(params[:id])
		@term_records = TermRecord.all
		@l1 = "english"
		@l2 = "french"
	end

end