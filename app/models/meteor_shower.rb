class MeteorShower
	attr_reader :name, :date

	@@showers = []

  def initialize(name, date)
    @name = name
    @date = DateParser.parse(date)
    @@showers << self
  end

  def self.create_from_scraper(meteor_hash)
  	meteor_hash.each do |name, date|
  		MeteorShower.new(name, date)
  	end
  end
  
  def self.all
  	@@showers.each do |shower|
  		puts "#{shower.name}: #{shower.date}"
  	end
  end

  def self.next_shower
		@@showers.each do |shower|
			if Date.today <= shower.date
				return shower
			elsif shower.date.nil?
				puts "Late July and early August, 2015"
			end
		end
		puts "No showers available."
  end

  def self.search(input)
  	months = {"January"=>1,"February"=>2,"March"=>3,"April"=>4,"May"=>5,"June"=>6,"July"=>7,"August"=>8,"September"=>9,"October"=>10,"November"=>11,"December"=>12}
  	@@showers.each do |shower|
  		if shower.date.is_a?(Date)
  			return shower if months[input] == shower.date.month
			elsif shower.date.include?(input)
				return shower
  		end
  	end
  	nil
  end

end
