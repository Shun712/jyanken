weapons = {g: "グー", c: "チョキ", p: "パー"}
@weapons = weapons
MATCH_TIMES = [1, 3, 5].freeze
@match_times = MATCH_TIMES
def select_times
  puts "何本勝負？(press 1 or 3 or 5)"
  times = gets.to_i
  if @match_times.include?(times)
    @times = times
    puts "#{times}本勝負を選びました"
  else
    puts "1か３か５を入力してください。"
    select_times
  end
end

select_times

CPU_WEAPON = [:g, :c, :p].freeze

def match
  cpu_weapon = CPU_WEAPON.sample
  @cpu_weapon = cpu_weapon
  puts "じゃんけん(press g or c or p)"
  your_weapon = gets.chomp.to_sym
  @your_weapon = your_weapon
  if CPU_WEAPON.include?(@your_weapon)
    @your_weapon = your_weapon
    puts "CPU...#{@weapons[cpu_weapon]}"
    puts "あなた...#{@weapons[your_weapon]}"
  else
    puts "gかcかpを入力してください。"
    match
  end
end

win, lose = 0, 0

n = 1
draw_flag = false
while n <= @times do
  puts "#{n}本目" unless draw_flag == true
  match
  if @your_weapon == @cpu_weapon
    puts "あいこで..."
    draw_flag = true
    redo
  elsif @your_weapon == :g && @cpu_weapon ==:c ||
        @your_weapon == :c && @cpu_weapon ==:p ||
        @your_weapon == :p && @cpu_weapon ==:g
        puts "勝ち！"
        win += 1
  else
    puts "負け！"
    lose += 1
  end
  puts "#{win}勝#{lose}敗"
  n += 1
  draw_flag = false
end

puts "結果"
win > lose ? judge = "勝ち" : judge = "負け"
puts "#{win}勝#{lose}敗であなたの#{judge}"