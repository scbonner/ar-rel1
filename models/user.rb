class User < ActiveRecord::Base
  belongs_to :team, optional: true
end



