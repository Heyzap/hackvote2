class Hack < ActiveRecord::Base
belongs_to :day

validates :creator, presence: true 
validates :title, presence: true, uniqueness:  { case_sensitive: false }

  def Hack.init(hack)
    hack.votes = 0
    hack.save
    return hack 
  end 

end
