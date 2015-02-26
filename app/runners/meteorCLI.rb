class MeteorCLI

	def typography
		puts Rainbow(%{								 ,ggg, ,ggg,_,ggg,                                                    }).color("3D003D").bright
		puts Rainbow(%{								dP""Y8dP""Y88P""Y8b             I8                                    }).color("3D003D").bright
		puts Rainbow(%{								Yb, `88'  `88'  `88             I8                                    }).color("660066").bright
		puts Rainbow(%{								 `"  88    88    88          88888888                                 }).color("8F008F").bright
		puts Rainbow(%{								     88    88    88             I8                                    }).color("B800B8").bright
		puts Rainbow(%{								     88    88    88   ,ggg,     I8     ,ggg,     ,ggggg,     ,gggggg, }).color("CC00CC").bright
		puts Rainbow(%{								     88    88    88  i8" "8i    I8    i8" "8i   dP"  "Y8ggg  dP""""8I }).color("D633D6").bright
		puts Rainbow(%{								     88    88    88  I8, ,8I   ,I8,   I8, ,8I  i8'    ,8I   ,8'    8I }).color("E066E0").bright
		puts Rainbow(%{								     88    88    Y8, `YbadP'  ,d88b,  `YbadP' ,d8,   ,d8'  ,dP     Y8,}).color("EB99EB").bright
		puts Rainbow(%{								     88    88    `Y8888P"Y88888P""Y88888P"Y888P"Y8888P"    8P      `Y8}).color("F5CCF5").bright

		puts Rainbow(%{								     ,gggg,                                                                               }).color("3D003D").bright
		puts Rainbow(%{								   ,88"""Y8b,             ,dPYb,                                8I                        }).color("3D003D").bright
		puts Rainbow(%{								  d8"     `Y8             IP'`Yb                                8I                        }).color("660066").bright
		puts Rainbow(%{								 d8'   8b  d8             I8  8I                                8I                        }).color("8F008F").bright
		puts Rainbow(%{								,8I    "Y88P'             I8  8'                                8I                        }).color("B800B8").bright
		puts Rainbow(%{								I8'             ,gggg,gg  I8 dP   ,ggg,    ,ggg,,ggg,     ,gggg,8I    ,gggg,gg   ,gggggg, }).color("CC00CC").bright
		puts Rainbow(%{								d8             dP"  "Y8I  I8dP   i8" "8i  ,8" "8P" "8,   dP"  "Y8I   dP"  "Y8I   dP""""8I }).color("D633D6").bright
		puts Rainbow(%{								Y8,           i8'    ,8I  I8P    I8, ,8I  I8   8I   8I  i8'    ,8I  i8'    ,8I  ,8'    8I }).color("E066E0").bright
		puts Rainbow(%{								`Yba,,_____, ,d8,   ,d8b,,d8b,_  `YbadP' ,dP   8I   Yb,,d8,   ,d8b,,d8,   ,d8b,,dP     Y8,}).color("EB99EB").bright
		puts Rainbow(%{								  `"Y8888888 P"Y8888P"`Y88P'"Y88888P"Y8888P'   8I   `Y8P"Y8888P"`Y8P"Y8888P"`Y88P      `Y8}).color("F5CCF5").bright
										                                                                                                                                                        
		
	end

	def call
		MeteorScraper.new.call
		puts typography
		puts "Welcome! My name is Copernicus."
		run
	end

	def run
		puts "Enter a command or type 'help':"
		input = gets_user_input
		if input == "help"
      help
    elsif input == "exit"
    	goodbye
    elsif input == "next shower"
    	next_shower
    elsif input == "calendar"
    	calendar
    elsif input == 'search'
    	search
    else
    	puts "Please enter a valid command."
    end
    run
  end

  def goodbye
  	puts "To know that we know what we know, and to know that we do not know what we do not know, that is true knowledge. Goodbye!"
  	exit
  end

  def next_shower
  	shower = MeteorShower.next_shower
    puts "#{shower.name}: #{shower.date}"
  end

  def calendar
  	MeteorShower.all
  end

  def search
  	puts "Please enter the name of a month: "
  	input = gets_user_input.capitalize
  	shower = MeteorShower.search(input)
  	if shower.nil?
  		puts "There are no meteor showers in that month."
  	else
    	puts "#{shower.name}: #{shower.date}"
    end   
  end

	def gets_user_input
		gets.chomp.strip
	end

	def help
		puts "Type 'exit' to exit the program."
		puts "Type 'help' to view this menu again."
		puts "Type 'next shower' to get the next predicted meteor shower."
		puts "Type 'calendar' for the full list of showers for the year 2015."
		puts "Type 'search' to search for meteor shower dates by month."
	end
end