class Theme < ApplicationRecord
	has_attached_file :template, styles: { medium: "200x200>", thumb: "200x200>" }
    validates_attachment_content_type :template, content_type: /\Aimage\/.*\z/
end
