class User < ActiveRecord::Base

  has_many :projects

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    [first_name, last_name].join(' ')
   end


end
