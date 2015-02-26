module DateParser
    def self.parse(date_string)
        months = "January|February|March|April|May|June|July|August|September|October|November|December"
        date_array =  date_string.scan(/(#{months}) (\d\d?).*?, (\d\d\d\d)/).flatten
        if date_array.empty?
            date_string.gsub(", the Delta Aquarids", "")
        else
            array_to_date_string(date_array)
        end
    end

    def self.array_to_date_string(date_array)
        Date.parse(date_array[0] + " " + date_array[1] + ", " + date_array[2])
    end
end