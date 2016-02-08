class Image < ActiveRecord::Base
  has_attached_file :document, styles: {largest: "1000x1000>", large: "750x750>", medium: "500x500>", small: "250x250>", thumbnail: "100x100#"}
  validates_attachment :document, content_type: { content_type: ["image/jpeg", "image/png", "image/jpg"] }
  
end
