# frozen_string_literal: true

require './card.rb'

class P18 < Pledge
  def initialize
    @title = 'I Love Animals'
    @card_type = 'Pledge'
    @cost = 0
    @text = 'Gain 4 VOTERS or LOCK 2 VOTERS'
  end

  def effect
    while true do
      puts "Enter 'G' to gain 4 voters or 'L' to lock 2 voters"
      input = gets.chomp
      if input == 'G'
        current_player.gain_voters(4)
        break
      elsif input == 'L'
        current_player.lock_voters(2)
        break
      else
        puts 'Not recognised, please enter again'
      end
    end
  end

end
