class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :name
  attr_accessible :avatar, :avatar_file_name
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :url  => "/assets/users/:id/:style/:basename.:extension", :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"


  def self.search (search_name)
  return scoped unless search_name.present?
    where(['name LIKE ? or first_name LIKE ? or last_name LIKE ?', "%#{search_name}%", "%#{search_name}%",  "%#{search_name}%"])
  end
  def avatar_url
  	self.avatar.url :thumb
  end
end
