require 'rails_helper'

RSpec.describe PhoneNumberController, type: :controller do
  describe "no user" do
    it "should redirect to signin" do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "logged in user" do
    it "should list a user's phone numbers" do
      login_with create(:user)
      get :index
      expect(response).to render_template(:index)
    end
  end
end
