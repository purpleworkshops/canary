class MessagesController < ApplicationController
  
  def new
    @n1 = rand(100..999)
    @n2 = rand(100..999)
    @sum = @n1 + @n2
  end

  def create
    if params[:answer].to_s.reverse.to_i == params[:sum].to_i
      MessageWorker.perform_async("Yes, the correct answer was #{params[:sum]}")
      redirect_to root_url, notice: "Message sent!"
    else
      redirect_to root_url, notice: "Nice try."
    end
  end
  
end