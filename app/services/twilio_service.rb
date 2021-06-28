class TwilioService

  def self.transmit(to:, content:)
    Rails.logger.tagged "TwilioService" do
      begin
        Rails.logger.info "Will send message to #{to}"
        phone_to = format_for_twilio(to)

        if phone_to.present?
          phone_from  = ENV['TWILIO_FROM']
          account_sid = ENV['TWILIO_ACCOUNT_SID']
          auth_token  = ENV['TWILIO_AUTH_TOKEN']
          
          twilio = Twilio::REST::Client.new(account_sid, auth_token)
          twilio.messages.create body: content, from: phone_from, to: phone_to
          Message.create content: content, sent_to: phone_to
          Rails.logger.info "Successfully sent message to #{to}"
        else
          Rails.logger.warn "Invalid phone number: #{to}"
        end

      rescue Twilio::REST::RestError => e
        Rails.logger.warn "[TwilioService] Error ##{e.code}: #{e.error_message}"
      end
    end
  end

  def self.format_for_twilio(number)
    number = number.gsub(/[\D\+]/,'')
    return number if number.length == 12 && number.starts_with?('+1')
    return "+#{number}" if number.length == 11 && number.starts_with?('1')
    return "+1#{number}" if number.length == 10
    nil
  end

  
end