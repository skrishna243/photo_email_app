module ApplicationHelper
	def school_name
		[
			['South Lakes High School', '0'], 
			['Hughes Middle School', '1'], 
			['Herndon High School', '2'], 
			['Fairfax County Public School', '3']
		]
	end

	def team_name
		[
			['Freshman', '0'], 
			['JV', '1'], 
			['Varsity', '2']
		]
	end

	def sport_name
		[
			['None', '0'],
			['FootBall', '1'], 
			['VolleyBall', '2'], 
			['Ice Hockey', '3'], 
			['BasketBall', '4']]
		
	end

	def scl_name(school_name)
		case school_name.to_i
		when 0
			'South Lakes High School'
		when 1
			'Hughes Middle School'
		when 2
			'Herndon High School'
		when 3
			'Fairfax County Public School'
		else 'N/A'
		end
	end

	def sprt_name(sprt_name)
		case sprt_name.to_i
		when 0
			'None'
		when 1
			'FootBall'
		when 2
			'VolleyBall'
		when 3
			'Ice Hockey'
		when 4
			'BasketBall'
		else 'N/A'
		end
	end

	def tm_name(tm_name)
		case tm_name.to_i
		when 0
			'Freshman'
		when 1
			'JV'
		when 2
			'Varsity'
		else 'N/A'
		end	
	end



end
