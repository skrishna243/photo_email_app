module ApplicationHelper
	def stu_gender_name(gender_type)
		if gender_type.nil?
			'N/A'
		else
			case gender_type.to_i
			when 0
				'Boys'
			when 1
				'Girls'
			when 2
				'CO-ED'
			else 'N/A'
			end
		end
	end

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
			['CO-ED', '3'],
			['Freshman', '0'], 
			['JV', '1'], 
			['Varsity', '2']
		]
	end

	def report_team_name
		[
			['All', 'All'],
			['Varsity', '2'],
			['JV', '1'], 
			['Freshman', '0'] 
			# ['Boys', '4'],
			# ['Girls', '5'],
			# ['CO-ED', '3']
			
		]
	end

	def fall_sport_name
		[
			['None', 'None'],
			['Band', 'Band'],
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
			['Gymnastics', 'Gymnastics'],
			['Lacrosse', 'Lacrosse'],
			['Outdoor Track', 'Outdoor Track'], 
			['Rugby', 'Rugby'],
			['Soccer', 'Soccer'],
			['Softball', 'Softball'],
			['Tennis', 'Tennis'],
			['VolleyBall', 'VolleyBall']	 	
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
			['Rifle', 'Rifle'],	
			['Scholastic Bowl', 'Scholastic Bowl'],
			['Swim', 'Swim'],
			['Trainers', 'Trainers'],	
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
		when 6
			'None'
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
			['All', 'All'],
			['Archery', 'Archery'],
			['Band', 'Band'],
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
			['Rifle', 'Rifle'],	 
			['Rugby', 'Rugby'],
			['Scholastic Bowl', 'Scholastic Bowl'],
			['Soccer', 'Soccer'],
			['Softball', 'Softball'],
			['Swim', 'Swim'],
			['Tennis', 'Tennis'],
			['Trainers', 'Trainers'],
			['Unified Tennis', 'Unified Tennis'],
			['VolleyBall', 'VolleyBall'],	
			['Wrestling', 'Wrestling']  
						
		]
	end

	def position_type(position)
		if position.nil?
			'N/A'
		else
			case position.to_i
			when 0
				'Athelete'
			when 1
				'Coach'
			when 2
				'Manager'
			else 'N/A'
			end
		end
	end



end
