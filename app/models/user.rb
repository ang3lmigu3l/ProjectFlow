class User < ActiveRecord::Base
  has_many :projects
  before_save :nil_if_blank

  validates_uniqueness_of :username

  extend FriendlyId

  def full_name
    [first_name, last_name].join(' ')
  end

  friendly_id :username, use: :slugged

  NULL_ATTRS = %w( facebook twitter github linkedin)

  has_attached_file :avatar, styles: { medium: "300x300>", small: "20x20#" , thumb: "150x150#" }, :default_url => ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



   protected

   def should_generate_new_friendly_id?
  slug.blank? || username_changed?
end

  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end

end
