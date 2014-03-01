class User < ActiveRecord::Base
  has_many :orders
  validates :email, uniqueness: true
  #attr_accessor :name
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def admin?
    admin == true
  end

end
