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
		# it "shows a list of students" do
		# 	student = {name: "Jean", cohort: :June}
		# 	shows.to eq "name: "
		# end

	end