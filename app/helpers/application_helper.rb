module ApplicationHelper
  def paperclip_hash_secret
    Rails.application.secrets.paperclip_hash_secret
  end
end
