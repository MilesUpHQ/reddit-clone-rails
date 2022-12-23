class PollsController < ApplicationController
    def create
        @poll=Poll.new
    end 
    
    def create
        @poll = Poll.new(poll_params)
        if @poll.save
          flash[:success] = 'Poll was created!'
         
        else
          render 'new'
        end
      end

      def destroy
        @poll = Poll.find(params[:id])
        if @poll.destroy
          flash[:success] = 'Poll was destroyed!'
        else
          flash[:warning] = 'Error destroying poll...'
        
      end  
    
    private
      def poll_params
        params.require(:poll).permit(:poll_option)
      end
end
