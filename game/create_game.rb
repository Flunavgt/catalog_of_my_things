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
    puts 'Is the game multiplayer? [Y | N]'
    print "\nAnswer: "
    user_answer = gets.chomp.downcase
    puts 'last played at'
    print "\nAnswer: "
    last_played = gets.chomp

    puts 'Game Name'
    print "\nAnswer: "
    game_name = gets.chomp
    game = Game.new(switch_case(user_answer), last_played, game_name)
    games << game
    puts "\nGame created successfully"
  end
end
