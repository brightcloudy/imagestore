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
end
