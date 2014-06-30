require 'directory'
	
describe "student directory to" do
	it "show a header" do
		allow(self).to receive(:puts).with("The students of my cohort at Makers Academy")
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
end