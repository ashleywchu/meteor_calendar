require 'spec_helper'
describe Date do
	let(:future)				{Date.new("July 10, 2015")}

	describe DateParser do
	    it "returns date from plain string" do
	        plain = "January 4, 2015 before dawn, the Quadrantids"
	        expect(DateParser.parse(plain).strftime("%B %d, %Y")).to eq("January 04, 2015")
	    end

	    it "returns date from complex string" do
	        complex = "Late night November 17 until dawn November 18, 2015, the Leonids"
	        expect(DateParser.parse(complex).strftime("%B %d, %Y")).to eq("November 17, 2015")
	    end

	    it "returns the earliest date from a range" do
	        date_range = "August 12-13, 2015 before dawn, the Perseids"
	        expect(DateParser.parse(date_range).strftime("%B %d, %Y")).to eq("August 12, 2015")
	    end

	    it "returns the original string if no match is found" do
	        impossible = "Late July and early August, 2015, the Delta Aquarids"
	        expect(DateParser.parse(impossible)).to eq(impossible)
	    end

	end

	# describe MeteorShower do
	# 	it "returns the 'Late July and early August, 2015, the Delta Aquarids'"
	#     		expect(MeteorShower.next_shower).to eq("Late July and early August, 2015")
	#   end
	# end
end