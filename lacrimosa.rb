use_debug false

use_bpm 180

home_dir = "/Users/christleijtens/project/private/Sonic Pi experiments/sonic_pi_lacrimosa_new_year/"

run_file home_dir + "lacrimosa_music.rb"
run_file home_dir + "lacrimosa_other.rb"



# main program

# rhythm thread
in_thread do
  
  # 24 beats
  8.times do
    rhythm 1.0
  end
  
  # 72 beats
  2.times do
    
    # 24 beats
    sleep 24
    
    # 12 beats
    4.times do
      rhythm 1.0
    end
  end
  
  # 48 beats
  16.times do
    rhythm 1.0 + (tick * 0.1)
  end
  
  # 6 beats
  2.times do
    rhythm 2.0
  end
  
  # 72 beats
  36.times do
    rhythm 2.0
  end
  
end



# music thread
in_thread do
  
  # 24 beats
  intro home_dir
  
  # 72 beats
  2.times do
    
    # 24 beats
    lacrimosa_intro
    
    # 12 beats
    lacrimosa_voices_intro
    
  end
  
  # 48 beats
  lacrimosa_rising_cords_seq
  
  # 6 beats
  track_rewind
  
  # 108 beats
  midnight_bell
  
end



# midnight countdown thread
in_thread do
  
  sleep 24 + 2 * ( 24 + 12 ) + 48 + 6 + 72
  countdown home_dir
  
end