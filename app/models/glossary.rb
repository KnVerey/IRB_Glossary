class Glossary < ActiveRecord::Base

	has_many :term_records, dependent: :destroy	

end
