#@osa-lang:AppleScript Debugger
use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

«event asDBDBid» "CADBC2CC-6FAC-4AE4-B6F3-85010D4266D1"
tell me to «event asDBLine» {1, 0, {}}
display dialog "Hello there from AppleScript." default answer "Bye bye" buttons {"Stop now", "Say bye!"} default button 2 cancel button 1 with title "My Script One" with icon note
tell me to «event asDBLine» {2, 0, {}}
say text returned of result



