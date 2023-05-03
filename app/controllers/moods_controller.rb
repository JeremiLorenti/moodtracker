class MoodsController < ApplicationController
    def new
      @mood = Mood.new
    end
    
    def create
      @mood = Mood.new(mood_params)
      if @mood.save
        redirect_to @mood
      else
        render 'new'
      end
    end
    
    def show
      @mood = Mood.find(params[:id])
      if @mood.nil? || @mood.date.nil? || @mood.mood.nil? || @mood.notes.nil?
        flash[:error] = "Sorry, something went wrong. Please try again later."
        redirect_to root_path
    end
    
    private
    
    def mood_params
      params.require(:mood).permit(:name, :description)
    end
  end
end
  