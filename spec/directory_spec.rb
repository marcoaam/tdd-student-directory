require 'directory'
	
describe "student directory to" do

	it "show a header" do
		expect(self).to receive(:puts).with("The students of my cohort at Makers Academy")
		show_header
	end

	it "have a empty students list" do
		expect(student_list).to be_empty
	end

	it "add a student to the students list" do
		student = {name: "Jean", cohort: :June}
		add(student)
		expect(student_list).to eq [student]
	end
	
	it "convert list of students to string" do
		student = {name: "Jean", cohort: :June}
		students = [{name: "Jean", cohort: :June}, {name: "Marco", cohort: :June}]
		add(student)
		expect(students_to_s(students)).to eq "Jean, June cohort\nMarco, June cohort"
	end

	it 'Print the students to the terminal' do
		student = {name: "Jean", cohort: :June}
		add(student)

		expect(self).to receive(:puts).with('Jean, June cohort')

		print_students
	end

	it 'Create a student hash' do
		expect(student_file("Marco", "June")).to eq ({name: "Marco", cohort: :June})
	end

	it 'Saves in a file' do
		expect(File).to receive(:open).with("students.csv","w")
		save_students_to_file
	end

	it 'Saves the student list in a file' do
		expected_list = [{:name => "Marco", :cohort => :June}, {:name => "Jean", :cohort => :May}]
		load_students
		save_students_to_file
		expect(student_list).to eq expected_list
	end

	it 'Load a file' do
		expect(File).to receive(:open).with("students.csv","r")
		load_students
	end

	it 'Read data from a file' do
		expected_list = [{:name => "Marco", :cohort => :June}, {:name => "Jean", :cohort => :May}]
		load_students
		expect(student_list).to eq expected_list
	end

	it 'Get and return input from the user' do
		expect(STDIN).to receive(:gets).and_return("Marco")
		expect(get_user_input).to eq "Marco"
	end

	it 'Get student name' do
		expect(self).to receive(:puts).with("Enter the name of the student")
		expect(self).to receive(:get_user_input)
		get_student_name
	end

	it 'Get student name' do
		expect(self).to receive(:puts).with("Enter the month of the cohort")
		expect(self).to receive(:get_user_input)
		get_student_cohort
	end

	it 'Prints interactive menu' do
		expect(self).to receive(:puts).with("Main Menu\n1.- Add Student\n2.-Show the students\n3.-Save student list to a file\n4.-Load student list from a file\n9.- exit")
		print_main_menu
	end

	context 'Have a menu option #' do

		it '1 that adds a student' do
			allow(self).to receive(:get_user_input).and_return("1")
			expect(self).to receive(:add)
			interactive_menu
		end

		it '2 that shows the list of students' do
			expect(self).to receive(:get_user_input).and_return("2")
			expect(self).to receive(:print_students)
			interactive_menu
		end

		it '3 that saves list of students to a file' do
			expect(self).to receive(:get_user_input).and_return("3")
			expect(self).to receive(:save_students_to_file)
			interactive_menu
		end

		it '4 that loads list of students from a file' do
			expect(self).to receive(:get_user_input).and_return("4")
			expect(self).to receive(:load_students)
			interactive_menu
		end

		it '9 to exit from the menu' do
			expect(self).to receive(:get_user_input).and_return("9")
			expect(self).to receive(:exit)
			interactive_menu
		end

	end
	
end