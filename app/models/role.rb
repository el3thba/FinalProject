class Role < ActiveRecord::Base
  has_many :users, through: :ideas
  
  
end
