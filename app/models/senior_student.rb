class SeniorStudent < ApplicationRecord
	belongs_to :senior_school
	has_many :senior_student_checks
end
