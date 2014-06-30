def show_header
	puts "The students of my cohort at Makers Academy"
end

def student_list
	@students ||= []
end	

def add(student)
	student_list << student
end

def students_to_s(students)
	students.map {|student| "#{student[:name]}, #{student[:cohort]} cohort"}.join("\n")
end

def print_students
	puts students_to_s(student_list)
end

def student_file(name,cohort)
	{:name => name, :cohort => cohort.to_sym}
end

def get_user_input
	STDIN.gets.chomp
end

def save_students_to_file
	File.open("students.csv","w") do|file|
		arrange_data_to_be_saved_in(file)
	end
end

def arrange_data_to_be_saved_in(file)
	student_list.each do |hash|
		name, cohort = hash[:name], hash[:cohort]
		file.puts name + ',' + cohort.to_s
	end
end

def load_students
	File.open("students.csv","r") do |file|
		arrange_data_from(file)
	end
end

def arrange_data_from(file)
	file.readlines.each do |line|
		name, cohort = line.split(',')
		add(student_file(name.capitalize, cohort.capitalize.rstrip))
	end	
end
