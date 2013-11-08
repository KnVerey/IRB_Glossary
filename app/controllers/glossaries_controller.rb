class GlossariesController < ApplicationController

	def index
	end

	def show
		@l1 = params[:l1]
		@l1 == "french" ? @l2 = "english" : @l2 = "french"
		@glossary = Glossary.find(params[:id])
		@presenter = GlossaryPresenters::ShowPresenter.new(@glossary, @l1, @l2)
	end

	def search
		@l1 = params[:l1]
		@l1 == "french" ? @l2 = "english" : @l2 = "french"
		@query = params[:search]
		@glossary = Glossary.find(params[:id])
		@term_records = @glossary.term_records.where("#{@l1} LIKE ?", "%#{@query}%")
	end

end