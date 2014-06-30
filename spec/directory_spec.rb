require 'directory'
	
describe "student directory to" do
	it "show a header" do
		allow(self).to receive(:puts).with("The students of my cohort at Makers Academy")
		show_header
	end
	it "has a empty students list" do
		expect(student_list).to be_empty
	end

	it "adds a student to the students list" do
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

	it 'Prints the students to the terminal' do
		student = {name: "Jean", cohort: :June}
		add(student)

		expect(self).to receive(:puts).with('Jean, June cohort')

		print_students
	end

	it 'Creates a student hash' do
		expect(student_file("Marco", "June")).to eq ({name: "Marco", cohort: :June})
	end

	it 'Saves a file with the list' do
		expect(File).to receive(:open).with("students.csv","w")
		save_students
	end

	it 'Loads from a file' do
		expect(File).to receive(:open).with("students.csv","r")
		load_students
	end
end