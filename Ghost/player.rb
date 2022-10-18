class Player
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def guess
        #begin
            puts "Please enter a lowercase letter #{name}"
            input = gets.chomp 

    #    rescue
    #        puts "let's try that again"
    #        puts "inputs can only be a lowercase letter"
    #        retry
    #    end
    #    input
    end

end