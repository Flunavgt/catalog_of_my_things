class CreateGame
  @user_answer = ''
  def self.switch_case(ans)
    case ans
    when 'y'
      true
    when 'n'
      false
    else
      puts "Please Enter Y/y for 'YES' and N/n for 'No' \n Answer: "
      answer = gets.chomp.downcase
      switch_case(answer)
    end
  end

  def self.create_game(games)
    system('cls')
    system('clear')
    puts 'Is the game multiplayer? [Y | N]'.magenta.bold.underline
    print 'Answer: '
    user_answer = gets.chomp.downcase
    puts "\nlast played at".magenta.bold.underline
    print 'Answer: '
    last_played = gets.chomp

    puts "\nGame Name".magenta.bold.underline
    print 'Answer: '
    game_name = gets.chomp
    game = Game.new(switch_case(user_answer), last_played, game_name)
    games << game
    puts "\nGame created successfully".green
  end
end
