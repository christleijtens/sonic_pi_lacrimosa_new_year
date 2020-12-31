
# Vinyl record rewind to start 12 'o clock bell
define :track_rewind do
  
  # 6 beats
  
  sample :vinyl_hiss, 4
  with_fx :panslicer do
    sample :vinyl_rewind, amp: 4
  end
  
  sleep 6
  
end



# Midnight church bell
define :midnight_bell do
  
  # 108 beats
  with_fx :echo, phase: 1.8, amp: 4, mix: 0.5 do
    12.times do
      use_synth :pretty_bell
      
      play :D3, release: 4
      sleep 9
    end
  end
  
end



define :countdown do |home_dir|
  
  # 36 beats
  
  samps_es_countdown = home_dir + "samps/es_count/"
  samps_nl_countdown = home_dir + "samps/nl_count/"
  samps_en_countdown = home_dir + "samps/en_count/"
  
  10.times do
    n = tick
    sample samps_es_countdown, n, amp: 3.5, pan: -1
    p = choose([0, 0.1, 0.2])
    sleep p
    sample samps_nl_countdown, n, amp: 4, pan: 0
    q = choose([0, 0.1, 0.2])
    sleep q
    sample samps_en_countdown, n, amp: 4.5, pan: 1
    sleep 3 - p - q
  end
  
  sample samps_es_countdown, 10, amp: 3.5, pan: -1
  sleep 2
  sample samps_nl_countdown, 10, amp: 4, pan: 0
  sleep 2
  sample samps_en_countdown, 10, amp: 4.5, pan: 1
  sleep 2
  
  sample home_dir + "samps/fireworks.wav", amp: 10

end



# The intro tune.
define :intro do |home_dir|
  
  # 24 beats
  
  samps = home_dir + "samps/intro/"
  
  with_fx :panslicer do
    sample :misc_cineboom, amp: 3
    sleep 6
  end
  
  with_fx :echo, phase: 0.2, pre_amp: 1, amp: 2 do
    with_fx :distortion, distort: 0.5 do
      sample samps, 0
      sleep 5
      sample samps, 1
      sleep 3
      sample samps, 2
      sleep 6
      sample samps, 3
      sleep 4
    end
  end
  
end



# The rhythm for the Lacrimosa part.
define :rhythm do |volume|
  
  # 3 beats
  
  with_fx :pan, pan: 0, amp: volume do
    sample :ambi_drone, pitch: -12
    sample :vinyl_hiss
    sample :bd_tek, pan: -1
    sleep 1
    sample :bd_haus, pan: 1
    sleep 1
    sample :bd_haus, pan: 1
    sleep 1
  end
  
end

