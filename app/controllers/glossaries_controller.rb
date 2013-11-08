class GlossariesController < ApplicationController

	before_filter :load_language, :only => [:show, :search]

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
		@presenter = GlossaryPresenters::SearchPresenter.new(@glossary, @l1, @l2, @query)
	end

	private

	def load_language
		redirect_to glossaries_path unless params[:l1] == 'french' || params[:l1] == 'english'
	end
end