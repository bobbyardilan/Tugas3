load "player.rb"

class MainMenu
  @@players = Array.new
  @@status = "1"
  def interface
    puts "========================================="
    puts "	Welcome to Battle Arena"
    puts "-----------------------------------------"
    puts "Description :"
    puts "1. Ketik 'new' untuk membuat karakter"
    puts "2. Ketik 'start' untuk memulai pertaungan"
    puts "------------------------------------------"
    @n = 0
    puts "Current Player"
    puts "* min player 2, max player 3"
	getInput()
  end

  def getInput
  while !isGameOver() do
      if @@status.eql? "1" and @@players.length <= 2 then
        puts "Pilih : "
        input = gets.chomp
      else
        input = "start"
      end
      
      if input.eql? "new" then
        @@status = "1"
        puts "Input player name : "
        playerName = gets.chomp
        @@players.push Player.new playerName
      
      elsif input.eql? "start" then
        if @@players.length <= 1 then
          puts "Minimal 2 Player"
        else
          @@status = "2"
          
          puts "Attacker : "
          atk = gets.chomp
          puts "Target: "
          targets = gets.chomp
          
         
          for player in @@players do
            if player.playerName.eql? atk then
               player.atk
            elsif player.playerName.eql? targets then
               player.defense
            end
            puts "#{player.playerName} : mana = #{player.mana}, blood = #{player.blood}"             
          end
                    
        end
      else
        puts "Input error"
      end
    end
    
    puts "GAME OVER"
  end
  def isGameOver
    status = false
    
    for player in @@players do
	  status = status || player.isGameOver()   
	end
	
	status
  end
end
main_menu = MainMenu.new 
main_menu.interface