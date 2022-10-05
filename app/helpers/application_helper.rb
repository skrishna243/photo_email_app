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

	def fall_sport_name
		[
			['None', 'None'],
			['Cheer', 'Cheer'], 
			['Crew', 'Crew'], 
			['Cross Country', 'Cross Country'], 
			['Field Hockey', 'Field Hockey'],
			['Football', 'Football'],
			['Golf', 'Golf'],
			['POMS', 'POMS'], 
			['Soccer', 'Soccer'], 
			['Tennis', 'Tennis'], 
			['Unified Tennis', 'Unified Tennis'],
			['VolleyBall', 'VolleyBall']
		]
	end

	def spring_sport_name
		[
			['Archery', 'Archery'],
			['Baseball', 'Baseball'],
			['Crew', 'Crew'],
			['Lacrosse', 'Lacrosse'],
			['Outdoor Track', 'Outdoor Track'], 
			['Rugby', 'Rugby'],
			['Soccer', 'Soccer'],
			['Softball', 'Softball'],
			['Tennis', 'Tennis']	 	
		]
	end

	def winter_sport_name
		[
			['Basketball', 'Basketball'],
			['Bocce Ball', 'Bocce Ball'],
			['Cheer', 'Cheer'],
			['Dance', 'Dance'],
			['Gymnastics', 'Gymnastics'],
			['Indoor Track', 'Indoor Track'], 
			['Marching Band', 'Marching Band'],
			['Middle School Basketball', 'Middle School Basketball'],	
			['Swim', 'Swim'],	
			['Wrestling', 'Wrestling'],
			 	
		]
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

	def date_formatted(date)
	    date.present? ? date.strftime('%b %d, %Y') : ''
	end

	def season_name
		[
			['FALL', 'FALL'],
			['SPRING', 'SPRING'], 
			['WINTER', 'WINTER'], 
		]
		
	end

	def all_sports_name
		[
			['Archery', 'Archery'],
			['Baseball', 'Baseball'],
			['Basketball', 'Basketball'],
			['Bocce Ball', 'Bocce Ball'],
			['Cheer', 'Cheer'],
			['Crew', 'Crew'], 
			['Cross Country', 'Cross Country'], 
			['Dance', 'Dance'],
			['Field Hockey', 'Field Hockey'],
			['Football', 'Football'],
			['Golf', 'Golf'],
			['Gymnastics', 'Gymnastics'],
			['Indoor Track', 'Indoor Track'],
			['Lacrosse', 'Lacrosse'],
			['Marching Band', 'Marching Band'],
			['Middle School Basketball', 'Middle School Basketball'],
			['Outdoor Track', 'Outdoor Track'], 
			['POMS', 'POMS'], 
			['Rugby', 'Rugby'],
			['Soccer', 'Soccer'],
			['Softball', 'Softball'],
			['Swim', 'Swim'],
			['Tennis', 'Tennis'],
			['Unified Tennis', 'Unified Tennis'],
			['VolleyBall', 'VolleyBall'],	
			['Wrestling', 'Wrestling']  
						
		]
	end



end
