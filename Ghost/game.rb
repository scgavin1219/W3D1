require "./player.rb"

class Game
    attr_reader :current_player, :fragment

    def initialize(name1, name2)
        @player_1 = Player.new(name1)
        @player_2 = Player.new(name2)
        @dictionary = File.read('dictionary.txt').split
        @fragment = ""
        @current_player = @player_1 
    end

    def next_player!
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def valid_play?(char)
        alphabet = ('a'..'z').to_a
        alphabet.include?(char.downcase)
    end

    def add_frag(char)
        @fragment << char
    end

    def win?
        @dictionary.include?(@fragment)
    end

    def take_turn
        puts "Your turn #{current_player.name}"
        input = @current_player.guess
        
        self.add_frag(input)
        puts "current fragment: #{@fragment}"

        if self.win? 
            puts "GAME OVER, #{current_player.name} LOSES"
        end
    end

    def play
        until self.win? 
            self.take_turn
            self.win?
            self.next_player!
        end
    end
end