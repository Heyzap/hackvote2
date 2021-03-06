class HacksController < ApplicationController
  def new
    @day = Day.find params[:day_id]
    @hack = Hack.new(:day => @day)
  end

  def create
    @day = Day.find_by_id(params[:day_id])
    @hack = Hack.create(hack_params)
    if @hack.save
      flash[:success] = "#{@hack.creator} made #{@hack.title}?!?! What a Hax0r!"
      redirect_to @day
    else
      render 'new'
    end
  end



private 

    def hack_params
      hackparams = params.require(:hack).permit(:creator, :title, :id, :day_id)
      hackparams[:day_id] = params[:day_id]
      return hackparams
    end

end
