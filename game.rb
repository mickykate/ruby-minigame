puts "最初はグーじゃんけん・・・・"
class MiniGame
  def initialize(draw = "あいこ", lose ="負け", win ="勝ち")
    @draw = draw
    @lose = lose
    @win = win
  end
  
def janken  #じゃんけんの実装
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

  if player_hand == program_hand
    puts "#{@draw}で..."
    puts "ショ！"
    return true
  elsif(player_hand == 0 && program_hand == 1)|| (player_hand == 1 && program_hand == 2)|| (player_hand == 2 && program_hand == 0)
    puts "あなたは#{@win}ました"
    return false #attimuite_hoiメソッドを呼び出す
    attimuite_hoi
  else (player_hand == 0 && program_hand == 2)|| (player_hand == 1 && program_hand == 0)|| (player_hand == 2 && program_hand == 1)
    puts "あなたは#{@lose}ました"
    return false #attimuite_hoiメソッドを呼びだす
    attimuite_hoi
  end
end

#あいこはじゃんけん繰り返し、勝ちまたは負けはあっち向いてホイに進むようにする
def attimuite_hoi #あっち向いてホイの処理
  puts "あっち向いて・・・"
  puts "[0]上\n[1]下\n[2]右\n[3]左"

  player_direction = gets.to_i
  program_direction = rand(4)
  puts "ホイ！"
  puts "---------------"

  attimuite_hoi = ["上", "下", "右", "左"]
  puts "あなた:#{attimuite_hoi[player_direction]}, あいて:#{attimuite_hoi[program_direction]}"

  if(player_direction == program_direction)
    puts "あなたの#{@win}です"
    return false
  elsif
    puts "あなたの#{@lose}です"
    return false
  else
    puts "#{@draw}です。もう一度..."
    return true
  end
 end
end

next_game = true

while next_game
  next_game = MiniGame.new.janken
end

next2_game = true

while next2_game
  next2_game = MiniGame.new.attimuite_hoi
end
