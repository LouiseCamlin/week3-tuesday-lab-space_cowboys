require "pry-byebug"
require_relative "models/bounty.rb"


bounty1 = Bounty.new({
    'name' => 'Jayne',
    'bounty_value' => 3000,
    'favourite_weapon' => 'Vera',
    'collected_by' => 'Jubal Early'
  })

bounty2 = Bounty.new({
    'name' => 'Bob',
    'bounty_value' => 200,
    'favourite_weapon' => 'gun',
    'collected_by' => 'Mad Jack'
  })


binding.pry
nil