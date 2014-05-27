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
  @day = Day.find_by_id(params[:id])
  if params[:hackdayRadio] 
    @hack = Hack.find_by_id(params[:hackdayRadio])
    if votes_left(@day) > 0 
      dec_votes(@day)
      flash[:success] = "Thank you for voting for #{@hack.title}!"
      @hack.votes += 1
      @hack.save!
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
      puts "heeeeereeee"
      render 'new'
    end
  end

private 

    def votes_left(day)
      day_token = day.id.to_s.to_sym
      cookies.permanent[day_token] ||= "3"
      return cookies.permanent[day_token].to_i
    end 

    def dec_votes(day) 
      day_token = day.id.to_s.to_sym
      votes = cookies.permanent[day_token].to_i
      cookies.permanent[day_token] = (votes - 1).to_s
    end 

    def day_params
      params.require(:day).permit(:title)
    end

end
