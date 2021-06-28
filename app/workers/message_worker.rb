class MessageWorker
  include Sidekiq::Worker

  def perform(content)
    Rails.logger.tagged "MessageWorker" do
     TwilioService.transmit content: content, to: ENV['TWILIO_TO']
    end
  end
end
