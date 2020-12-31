# The intro of Lacrimosa (violins in the original)
define :lacrimosa_intro do
  
  # 24 beats
  
  #use_synth_defaults sustain: 3, env_curve: 1, attack: 0.3
  use_synth :hollow
  
  with_fx :pan, pan: -0.5 do
    with_fx :tremolo, depth: 0.4, mix: 0.6 do
      with_fx :vowel, voice: 3, vowel_sound: 1, mix: 0.9, amp: 2, attack: 0, release: 0, decay: 0, pre_amp: 1 do |n|
        
        # Bar 1
        
        play [:D4, :F4], sustain: 2
        sleep 1
        
        play :Cs5
        sleep 1
        play :D5
        sleep 1
        
        play [:F4, :A4], sustain: 2
        sleep 1
        
        play :A5
        sleep 1
        play :Bb5
        sleep 1
        
        control n, vowel_sound: 3
        
        play [:E4, :G4], sustain: 2
        sleep 1
        
        play :D5
        sleep 1
        play :Cs5
        sleep 1
        
        play [:G4, :Cs5], sustain: 2
        sleep 1
        
        play :C6
        sleep 1
        play :Bb5
        sleep 1
        
        # Bar 2
        
        control n, vowel_sound: 4
        
        play [:F4, :D5], sustain: 2
        sleep 1
        
        play :A5
        sleep 1
        play :D6
        sleep 1
        
        play [:G3, :E4], sustain: 2
        sleep 1
        
        play :Bb5
        sleep 1
        play :G5
        sleep 1
        
        control n, vowel_sound: 1
        
        play [:F3, :D4], sustain: 2
        sleep 1
        
        play :E5
        sleep 1
        play :F5
        sleep 1
        
        play [:A3, :G4], sustain: 2
        sleep 1
        
        play :A5
        sleep 1
        play :Cs5
        sleep 1
        
      end
    end
  end
end



# The Lacrimosa melody as song by the choir
define :lacrimosa_voices_intro do
  
  # 12 beats
  
  use_synth :pretty_bell
  with_fx :pan, pan: 0.5 do
    with_fx :tremolo, depth: 0.4, mix: 0.6 do
      with_fx :vowel, voice: 4, vowel_sound: 3, mix: 0.9, amp: 1, attack: 0, release: 0, decay: 0, pre_amp: 1 do |r|
        
        play :A4, sustain: 2
        sleep 2
        play :F5, sustain: 0.5
        sleep 0.5
        play :D5, sustain: 0.5
        sleep 0.5
        play :D5, sustain: 1.5
        sleep 1.5
        play :Cs5, sustain: 0.5
        sleep 1.5
        
        control r, vowel_sound: 3
        
        play :A4, sustain: 2
        sleep 2
        play :F5, sustain: 0.5
        sleep 0.5
        play :D5, sustain: 0.5
        sleep 0.5
        play :D5, sustain: 1.5
        sleep 1.5
        play :Cs5, sustain: 0.5
        sleep 1.5
        
      end
    end
  end
end



# Rising cords of Lacrimosa single segment.
define :lacrimosa_rising_cord_seg do |cords_arr, volume|
  
  # 3 beats
  
  pan_arr = [-0.9, -0.6, -0.3, 0, 0.3, 0.6, 0.9]
  
  curr_cord_arr = cords_arr[0]
  curr_high_arr = cords_arr[1]
  curr_low_arr = cords_arr[2]
  
  with_synth :hollow do
    with_fx :echo do
      
      tick_reset
      
      curr_cord_arr.each do
        play curr_cord_arr[tick], pan: pan_arr[tick], amp: volume
        sleep 0.1
      end
      sleep 1 - ( curr_cord_arr.length * 0.1 )
      
    end
  end
  
  with_synth :pretty_bell do
    with_fx :echo do
      
      play curr_high_arr, sustain: 1, amp: volume
      sleep 1
      play curr_low_arr, sustain: 2, amp: volume
      sleep 1
      
    end
  end
  
end



# Rising cords of Lacrimosa
define :lacrimosa_rising_cords_seq do
  
  # 48 beats
  
  use_synth :pretty_bell
  
  cords_arr = [
    [ # 0 (1)
      [:D2, :A2, :D3, :F3, :A3, :D4],
      [:Gs3, :Gs4],
      [:A3, :A4]
      ],
    [ # 1 (1)
      [:A1, :A2, :E3, :A3, :Cs4, :E4],
      [:Bb3, :Bb4],
      [:A3, :A4]
      
      ],
    [ # 2 (1)
      [:D2, :F2, :A2, :D3, :F3, :A3, :D4, :F4],
      [:A3, :A4],
      [:Bb3, :Bb4]
      ],
    [ # 3 (1)
      [:C2, :G2, :C3, :E3, :G3, :C4, :E4, :G4],
      [:B3, :B4],
      [:C4, :C5]
      ],
    [ # 4 (2)
      [:F2, :A2, :C3, :F3, :A3, :C4, :F4, :A4],
      [:C4, :C5],
      [:D4, :D5]
      ],
    [ # 5 (2)
      [:E2, :B2, :E3, :Gs3, :B3, :E4, :Gs4, :B4],
      [:Ds4, :Ds5],
      [:E4, :E5]
      ],
    [ # 6 (2)
      [:A1, :C3, :E3, :A3, :C4, :E4, :A4, :C5],
      [:E4, :E5],
      [:F4, :F5]
      ],
    [ # 7 (2)
      [:G2, :D3, :G3, :B3, :D4, :G4, :B4, :D5],
      [:Fs4, :Fs5],
      [:G4, :G5]
      ],
    [ # 8 (3)
      [:C3, :Eb3, :G3, :C4, :Eb4, :G4, :C5, :Eb5],
      [:B3, :B4, :B5],
      [:C4, :C5, :C6]
      ],
    [ # 9 (3)
      [:Bb3, :E3, :G3, :Bb4, :E4, :G4, :C5, :E5],
      [:Db4, :Db5, :Db6],
      [:C4, :C5, :C6]
      ],
    [ # 10 (3)
      [:A2, :F3, :A3, :F4, :A4, :C5, :F5],
      [:D4, :D5, :D6],
      [:C4, :C5, :C6]
      ],
    [ # 11 (3)
      [:C3, :Fs3, :A3, :C4, :Fs5, :A5, :Eb6, :Fs6],
      [:Eb4, :Eb5, :Eb6],
      [:D4, :D5, :D6]
      ],
    [ # 12 (4)
      [:B2, :D3, :G3, :B3, :G4, :B4, :D5, :G5],
      [:Fs4, :Fs5, :Fs6],
      [:G4, :G5, :G6]
      ],
    [
      [:Bb3, :D4, :F4, :Bb4, :Gs4, :D5, :F5, :Gs5],
      [:G4, :G5, :G6],
      [:Gs4, :Gs5, :Gs6]
    ],
    [
      [:A2, :D3, :F3, :A3, :A4, :D5, :F5, :A5],
      [:Gs4, :Gs5, :Gs6],
      [:A4, :A5, :A6]
    ],
    [
      [:A2, :Cs3, :E3, :A3, :A4, :Cs5, :E5, :A5],
      [:Bb4, :Bb5, :Bb6],
      [:A4, :A5, :A6]
    ]
  ]
  
  lacrimosa_rising_cord_seg cords_arr[0], 0.25
  lacrimosa_rising_cord_seg cords_arr[1], 0.50
  lacrimosa_rising_cord_seg cords_arr[2], 0.75
  lacrimosa_rising_cord_seg cords_arr[3], 1.00
  
  lacrimosa_rising_cord_seg cords_arr[4], 1.25
  lacrimosa_rising_cord_seg cords_arr[5], 1.50
  lacrimosa_rising_cord_seg cords_arr[6], 1.75
  lacrimosa_rising_cord_seg cords_arr[7], 2.00
  
  lacrimosa_rising_cord_seg cords_arr[8], 2.25
  lacrimosa_rising_cord_seg cords_arr[9], 2.50
  lacrimosa_rising_cord_seg cords_arr[10], 2.75
  lacrimosa_rising_cord_seg cords_arr[11], 3.00
  
  lacrimosa_rising_cord_seg cords_arr[12], 3.25
  lacrimosa_rising_cord_seg cords_arr[13], 3.50
  lacrimosa_rising_cord_seg cords_arr[14], 3.75
  lacrimosa_rising_cord_seg cords_arr[15], 4.00
  
end