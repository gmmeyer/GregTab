module Api
  class DebatersController < ApiController

    def show
      @debater = Debater.find(params[:id])
    end

    def new
      @debater = Debater.new
    end

    def create
      @debater = Debater.new(debater_params)
      #I need to add a new thing here for schools
      if @debater.save
        flash[:notices] = ["You made a new debater"]
        redirect_to debaters_url
      else
        flash[:errors] = @debater.errors.full_messages
        render :new
      end
    end

    private
    def debater_params
      params.require(:debater).permit(:name)
    end

  end
end
