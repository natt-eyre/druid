class User < ActiveRecord::Base
  include Clearance::User
  has_many :issues
  has_many :completions
end
