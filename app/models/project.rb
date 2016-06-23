class Project < ActiveRecord::Base
  belongs_to :user
  NULL_ATTRS = %w(project_link)
  before_save :nil_if_blank

    has_attached_file :preview, styles: { large: "550x550>", medium: "300x300> ", small: "250x250#", thumb: "100x100#"},  :default_url => ActionController::Base.helpers.asset_path('preview.png')
    validates_attachment_content_type :preview, content_type: /\Aimage\/.*\Z/

    default_scope {order('date_started DESC')}

    def nil_if_blank
      NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
    end

end
