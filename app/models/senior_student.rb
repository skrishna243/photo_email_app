class SeniorStudent < ApplicationRecord
	belongs_to :senior_school, class_name: 'SeniorSchool', foreign_key: 'school_id'
	has_many :senior_student_checks
end
