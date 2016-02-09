class Image < ActiveRecord::Base
  has_attached_file :document, 
    {
      styles: { largest: "1000x1000>", large: "750x750>", medium: "500x500>", small: "250x250>", thumbnail: "100x100#" },
      url: "/system/:class/:attachment/:id_partition/:style/:hash.:extension",
      hash_secret: '803e82ceccdac4f57334d7b86f2c8196bd7ff30bd767ff2d53cfd3bb2b0ac2cc14e761b235bbf9e6d843dd40f11cbd63dfe69441197406d22d50faa2c142d795'
    }

  validates_attachment :document, content_type: { content_type: ["image/jpeg", "image/png", "image/jpg"] }

  has_one :user
end
