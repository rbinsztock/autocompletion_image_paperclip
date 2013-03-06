class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :name
  attr_accessible :avatar, :avatar_file_name
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png", :url  => "/assets/users/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/users/:id/:style/:basename.:extension"
end
