class Day < ActiveRecord::Base
has_many :hacks

validates :title, presence: true, uniqueness:  { case_sensitive: false } 

end
