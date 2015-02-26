class MeteorScraper
	attr_reader :html

  def call
  	data = Nokogiri::HTML(open('http://earthsky.org/astronomy-essentials/earthskys-meteor-shower-guide#quadrantids'))
  	entry = data.css("strong")
  	meteor_hash = {
  		"The Quadrantids" => entry[1].text,
  		"The Lyrid" => entry[3].text,
  		"The Eta Aquarids" => entry[4].text,
  		"The Delta Aquarids" => entry[5].text,
  		"The Perseids" => entry[6].text,
  		"The Draconids" => entry[7].text,
  		"The Orionids" => entry[8].text,
  		"The South Taurids" => entry[9].text,
  		"The North Taurids" => entry[10].text,
  		"The Leonids" => entry[11].text,
  		"The Geminids" => entry[12].text
  	}
  	MeteorShower.create_from_scraper(meteor_hash)
  end
end