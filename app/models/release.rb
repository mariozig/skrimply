class Release < ActiveRecord::Base
  attr_accessible :label_id, :location, :name, :release_date, :release_type_id
end
