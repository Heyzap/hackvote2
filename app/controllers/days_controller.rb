class DaysController < ApplicationController

  def new
    @day = Day.new 
  end

  def show
    @day = Day.find_by_id(params[:id])
    @votes_left = votes_left(@day)
  end

  def index
    @days = Day.all
  end

  def update 
  @day = Day.find_by_id(params[:day_id])
  if params[:hackdayRadio] 
    @hack = Hack.find_by_title(params[:hackdayRadio])
    if votes_left(@day) > 0 
      dec_votes(@day)
      flash[:success] = "Thank you for voting for #{@hack.title}!"
      @hack.votes += 1
      @hack.save 
    else
      flash[:error] = "You have no votes left for #{@day.title}!"
    end
  end
  redirect_to @day
  end
  
  def create
    @day = Day.new(day_params)
    if @day.save
      flash[:success] = "Welcome to Hackday #{@day.title}! Get hacking!"
      redirect_to @day
    else 
      render 'new'
    end
  end

private 
    def votes_left(day)
      unless cookies.permanent[day.title.to_sym]
        cookies.permanent[day.title.to_sym] = "3"
      end
      return cookies.permanent[day.title.to_sym].to_i
    end 

    def dec_votes(day) 
      votes = cookies.permanent[day.title.to_sym].to_i
      cookies.permanent[day.title.to_sym] = (votes - 1).to_s
    end 

    def day_params
      params.require(:day).permit(:title)
    end

end
