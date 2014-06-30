def show_header
	puts "The students of my cohort at Makers Academy"
end

def student_list
	@students ||= []
end	

def add(student)
	student_list << student
end