class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def voice_call
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Thank you for calling the Image Store MMS Number. To use this service, please visit our website and add your phone number to your account. You can then send MMS messages to this number to upload images.', :voice => 'alice'
      r.Play 'http://imgstr.xyz/audio/hold.mp3', :loop => 0
    end

    render_twiml response
  end

  def sms
    user = User.find_by(id: PhoneNumber.find_by(number: params['From']).user_id)
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

  def send_mms
    if !user_signed_in?
      return
    end
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    @client.account.messages.create({
      :from => '+12672744480',
      :to => params[:phone_number][:number],
      :body => "Image sent by http://imgstr.xyz/",
      :media_url => params[:phone_number][:imageurl]
    })
    flash[:success] = "MMS sent!"
    redirect_to :back
  end
end
