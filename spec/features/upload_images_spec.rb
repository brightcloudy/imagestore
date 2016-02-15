require 'rails_helper'

RSpec.feature "UploadImages", type: :feature do
  it "should handle no images" do
    login_as create(:user), scope: :user
    visit images_path
    expect(page).to have_content 'Upload'
  end

  it "should upload an image" do
    login_as create(:user), scope: :user
    visit new_image_path
    within "#new_image" do 
      attach_file "image_document", Rails.root.join('public', 'images', 'grey.png')
    end

    click_link_or_button "Create Image"

    expect(Image.count).to eq(1)
  end
end
