require 'mongoid'

class Thing
	include Mongoid::Document
	include Mongoid::Timestamps

	field :name
	field :thing_id

end