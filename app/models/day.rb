class Day < ActiveRecord::Base
has_many :hacks

validates :title, presence: true

end
