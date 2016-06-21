class Project < ActiveRecord::Base
  belongs_to :user

    has_attached_file :preview, styles: { large: "450x450>", medium: "300x300> ", thumb: "100x100>"},  :default_url => ActionController::Base.helpers.asset_path('preview.png')
    validates_attachment_content_type :preview, content_type: /\Aimage\/.*\Z/

end
