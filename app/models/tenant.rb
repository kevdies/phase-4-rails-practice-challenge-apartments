class Tenant < ApplicationRecord
    has_many :apartments
    has_many :leases
end
