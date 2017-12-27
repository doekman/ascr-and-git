use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

display dialog "Hello there from AppleScript." default answer "Bye bye" buttons {"Stop now", "Say bye!"} default button 2 cancel button 1 with title "My Script One" with icon note
say text returned of result



