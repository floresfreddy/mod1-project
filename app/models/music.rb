def play_music

    
    # pid = fork{ exec 'afplay -v 1', "$ bin/Tequila.mp3 -v 1" }

    pid = fork{ exec "afplay -v .2 bin/Tequila.mp3" }

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
