class HacksController < ApplicationController
  def new
    @day = Day.find params[:day_id]
    @hack = Hack.new(:day => @day)
  end

  def create
    @day = Day.find params[:day_id]
    @hack = Hack.init(Hack.new(hack_params))
    @hack.assign_attributes({:day_id => params[:day_id]})
    if @hack.save
      flash[:success] = "#{@hack.creator} made #{@hack.title}?!?! What a Haxxxor!"
      redirect_to (Day.find @hack.day_id)
    else
      render 'new'
    end
  end

  def index 
    redirect_to @day
  end


private 

    def hack_params
      params.require(:hack).permit(:creator, :title, :id, :day_id)
    end

end
