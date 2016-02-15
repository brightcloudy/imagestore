class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def voice_call
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Why did you even call here?', :voice => 'alice'
    end

    render_twiml response
  end

  def sms
    user = User.find_by(user_id: PhoneNumber.find_by(number: params['From']).user_id)
    if user.nil?
      response = Twilio::TwiML::Response.new do |r|
        r.Message "Unrecognized phone number!"
      end

      render_twiml response
      return
    end
    if params['NumMedia'] == 0
      response = Twilio::TwiML::Response.new do |r|
        r.Message "Please only send MMS messages with pictures to this phone number."
      end

      render_twiml response
      return
    end
    newimage = Image.new
    newimage.user_id = user.id
    newimage.random_url = SecureRandom.hex(3)
    newimage.document_remote_url = params["MediaUrl0"]

    newimage.save

    response = Twilio::TwiML::Response.new do |r|                                                                                                           
      r.Message "Uploaded! View at http://imgstr.xyz/image/#{newimage.random_url}"
    end  
    render_twiml response
  end

end
