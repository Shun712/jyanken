puts "何本勝負？(press 1 or 3 or 5)"

times = gets.to_i 

puts "#{times}本勝負を選びました"

weapons = {g: "グー", c: "チョキ", p: "パー"}

win, lose = 0, 0

n = 1
count = 0
until n > times do
  puts "#{n}本目" unless count == 1
  cpu_weapon = [:g, :c, :p].sample
  puts "じゃんけん(press g or c or p)"
  your_weapon = gets.chomp.to_sym
  puts "CPU...#{weapons[cpu_weapon]}"
  puts "あなた...#{weapons[your_weapon]}"
  if your_weapon == cpu_weapon
    puts "あいこで..."
    count = 1
    redo
  elsif your_weapon == :g && cpu_weapon ==:c ||
        your_weapon == :c && cpu_weapon ==:p ||
        your_weapon == :p && cpu_weapon ==:g
        puts "勝ち！"
        win += 1
  else
    puts "負け！"
    lose += 1
  end
  puts "#{win}勝#{lose}敗"
  n += 1
  count = 0
end

puts "結果"
win > lose ? judge = "勝ち" : judge = "負け"
puts "#{win}勝#{lose}敗であなたの#{judge}"
