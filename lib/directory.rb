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

def save_students
	File.open("students.csv","w") do|file|
		student_list.each do |hash|
		name = hash[:name]
		cohort = hash[:cohort]
		file.puts name + ',' + cohort.to_s
		end
	end
end

def load_students
	File.open("students.csv","r") do |file|
		file.readlines.each do |lines|
			name, cohort = line.split(',')
			add(student_file(name, cohort))
			end		
	end
end
