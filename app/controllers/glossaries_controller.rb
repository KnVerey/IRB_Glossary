class GlossariesController < ApplicationController

	def index
		@glossaries = Glossary.all
	end

	def show
		@glossary = Glossary.find(params[:id])
		@term_records = @glossary.term_records.all
		@l1 = params[:l1]
		@l1 == "french" ? @l2 = "english" : @l2 = "french"
		@chapter_list = @glossary.chapter_list(@l1)
	end

	def search
		
	end

end