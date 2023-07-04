def startGame
  until isGameEnded? do
  end
end

def isGameEnded?
  rock_scissors_paper_status = rockScissorsPaperGo
  # じゃんけんパートでプレイヤーが3(ゲームを止める)を選択した場合
  if rock_scissors_paper_status == "exit"
    return true
  elsif rock_scissors_paper_status == "draw"
    return false
  end

  if !lookThisWay
    puts "じゃんけん..."
    return false
  # あっちむいてホイで勝負がついているかつじゃんけんでプレイヤー側が勝利している
  elsif rock_scissors_paper_status == "playerwin"
    puts "YOU WIN!!"
    return true
  # あっちむいてホイで勝負がついているかつじゃんけんでプレイヤー側が敗北している
  else
    puts "YOU LOSE..."
    return true
  end
end

def rockScissorsPaperGo
  choices = ["グー", "チョキ", "パー", "ゲームを止める"]
  showChoices(choices)
  player_choice = gets.chomp.to_i
  player_choice = checkInput(player_choice, choices)

  if player_choice == 3
    puts "ゲームを終了します"
    status = "exit"
  else
    cpu_choice = rand(3)
    showResult(choices, player_choice, cpu_choice)
    if player_choice == cpu_choice
      puts "あいこで..."
      status = "draw"
    elsif (player_choice == 0 && cpu_choice == 1) || (player_choice == 1 && cpu_choice == 2) || (player_choice == 2 && cpu_choice == 0)
      puts "あなたの勝ちです"
      status = "playerwin"
    else
      puts "あなたの負けです"
      status = "playerlose"
    end
  return status
  end
end

def lookThisWay
  puts "あっち向いて〜"
  choices = ["上", "下", "左", "右"]
  showChoices(choices)
  player_choice = gets.chomp.to_i
  player_choice = checkInput(player_choice, choices)
  cpu_choice = rand(4)
  showResult(choices, player_choice, cpu_choice)
  return (player_choice == cpu_choice)
end

def showChoices(choices)
  choices.each_with_index do |choice, index|
    print "#{index}(#{choice})"
  end
  puts ""
end

def checkInput(player_choice, choices)
  until [0, 1, 2, 3].include?(player_choice) do
    puts "入力値が不正なためもう一度いずれかの数字を入力してください"
    showChoices(choices)
    player_choice = gets.chomp.to_i
  end
  return player_choice
end

def showResult(choices, player_choice, cpu_choice)
  separator = "----------------"
  puts "ホイ！"
  puts separator
  puts "あなた: #{choices[player_choice]}"
  puts "CPU: #{choices[cpu_choice]}"
  puts separator
end

puts "じゃんけん..."
startGame
