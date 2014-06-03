module Api
  class JudgesController < ApiController

    def show
      @judge = Judge.find(params[:id])
    end


    def new
      @judge = Judge.new
    end

    def create
      @judge = Judge.new(judge_params)
      if @judge.save
        redirect_to root_url
      else
        flash[:errors] = @judge.errors.full_messages
        render :new
      end
    end

  end
end
