class Games::CLI

    def call                    #start of cli
        puts "Here is a current list of my top five PS4 games!"
        list
        directory
    end

    def list
        @list = Games::Scrapper.games
        @list.each.with_index(1) do |game, i|
            puts "#{i}. #{game.title}"
        end
    end

    def exit
        puts "Hope you enjoyed this little selection."
    end

    def directory
        input = nil
        while input != "exit"
            puts "select a game to learn more about."
            input = gets.strip.downcase
            if input.to_i > 0
                the_game = @list[input.to_i-1]
                puts "#{the_game.title}"
                puts "#{the_game.content}"
                puts "#{the_game.description}"
            else
                puts "Not a valid input. Try again."
            end
        end
    end
end
