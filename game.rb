require "csv"
puts "最初はグーじゃんけん・・・・" #あいこはじゃんけん繰り返し、勝ちまたは負けはあっち向いてホイに進むようにする
class MiniGame
  $case_pattern = nil
  def initialize(draw = "あいこ", lose ="負け", win ="勝ち")
    @draw = draw
    @lose = lose
    @win = win
  end

def janken #じゃんけんの実装
  puts "[0]グー\n[1]チョキ\n[2]パー\n[3]戦わない"
  
  player_hand = gets.to_i
  program_hand = rand(3)
  puts "ホイ！"
  puts "---------------"

if player_hand > 3
  puts "入力された値が無効です。0-3の数字を入力してください。"
  return true
end

if player_hand == 3
  puts "ゲームを終了します"
  exit
end

  jankens = ["グー", "チョキ","パー","戦わない"]
  puts "あなたは#{jankens[player_hand]}を出しました\n相手は#{jankens[program_hand]}を出しました"
  puts "---------------"
  
  if(player_hand == program_hand)
    puts "#{@draw}で..."
    return true
  elsif(player_hand == 0 && program_hand == 1)|| (player_hand == 1 && program_hand == 2)|| (player_hand == 2 && program_hand == 0)
    $case_pattern = "win"
    attimuite_hoi #attimuite_hoiメソッドを呼び出す
  else(player_hand == 0 && program_hand == 2)|| (player_hand == 1 && program_hand == 0)|| (player_hand == 2 && program_hand == 1)
    $case_pattern = "lose"
    attimuite_hoi #attimuite_hoiメソッドを呼び出す
  end
end


def attimuite_hoi #あっち向いてホイの処理
  puts "あっち向いて・・・"
  puts "[0]上\n[1]下\n[2]右\n[3]左"

  player_direction = gets.to_i
  program_direction = rand(4)
  puts "ホイ！"
  puts "---------------"

  attimuite_hoi = ["上", "下", "右", "左"]
  puts "あなた:#{attimuite_hoi[player_direction]}, あいて:#{attimuite_hoi[program_direction]}"

  if $case_pattern == "win" && player_direction == program_direction #同じ方向を向いたら、勝ち  
     puts "あなたの#{@win}です"
     puts "---------------"
     exit
  elsif $case_pattern = "lose" && player_direction == program_direction
     puts "あなたの#{@lose}です"
     puts "---------------"
     exit
  else
    puts "引き分け。ジャンケンを再開"
    puts "---------------"
    puts "じゃんけん..."
    return true
  end
end

miniGame = MiniGame.new()
next_game = true

while next_game
  next_game = miniGame.janken
end

miniGame.attimuite_hoi
end
