def play_music
    
    pid = fork{ exec 'afplay', "bin/Tequila.mp3" }
    # pid = fork{ system 'afplay -v 0.5', 'bin/Tequila.mp3' }

    pid

    $play = true

    

end

def kill_music

    if $play == true

        pid = fork{ system 'killall', 'afplay' }
        pid
        $play = false
    else
        return

    end

end
