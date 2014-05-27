class Hack < ActiveRecord::Base
belongs_to :day

validates :creator, presence: true 
validates :title, presence: true

end
