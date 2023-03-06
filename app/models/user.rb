class User < ActiveRecord::Base
    has_many :services
    has_many :plumbers, through: :services
end