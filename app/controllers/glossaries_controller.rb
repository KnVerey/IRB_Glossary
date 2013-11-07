class GlossariesController < ApplicationController

	def index
	end

	def show
		@glossary = Glossary.find(params[:id])
		@term_records = @glossary.term_records.all
		@l1 = params[:l1]
		@l1 == "french" ? @l2 = "english" : @l2 = "french"
		@chapter_list = @glossary.chapter_list(@l1)
	end

	def search
		@glossary = Glossary.find(params[:id])
		@term_records = []
		@l1 = params[:l1]
		@l1 == "french" ? @l2 = "english" : @l2 = "french"
		
		@query = params[:search]
		@glossary.term_records.all.each do |record|
			if @l1 == "english"
				(@term_records << record) if record.english.downcase.include? (@query.downcase)
			else
				(@term_records << record) if record.french.downcase.include? (@query.downcase)
			end
		end
	end

end