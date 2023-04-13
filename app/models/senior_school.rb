class SeniorSchool < ApplicationRecord
	has_many :senior_students, class_name: 'SeniorStudent', foreign_key: 'school_id'
end
