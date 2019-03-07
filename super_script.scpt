#@osa-lang:AppleScript
use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

try
	display dialog "Hello there from AppleScript. What shall I read to you out loud?" default answer "Bye bye" buttons {"Stop now", "Please read to me!"} default button 2 cancel button 1 with title "My super script" with icon note
	say text returned of result
on error number -128 --user pressed cancel
	display notification "Please come back soon!" with title "No worries"
end try
