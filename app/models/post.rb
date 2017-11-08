class Post < ApplicationRecord
	belongs_to :user
    mount_uploader :image, AvatarPicUploader
    mount_base64_uploader :image, AvatarUploader
    #before_save :decode_image_data, :if => :image_data_provided?


 #    def decode_image_data 
	# 	# decode the base64
	# 	data = StringIO.new(Base64.decode64(self.image))
	# 	# assign some attributes for carrierwave processing
	# 	data.class.class_eval { attr_accessor :original_filename, :content_type }
	# 	data.original_filename = SecureRandom.hex(16) + ".png"
	# 	data.content_type = "image/png"
	# 	self.image = data
	# 	# return decoded data
	# 	data
	# end

	# def image_data_provided?
	# 	!self.image.blank?
	# end

end
