class Service < ActiveRecord::Base
    belongs_to :user
    belongs_to :plumber
end