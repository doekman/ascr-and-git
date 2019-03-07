-- iambored
-- Quick port of: https://gist.github.com/doekman/834a0d6a9c6e9598a42ca647462cf6da

set AppleScript's text item delimiters to return
set get_links_command to "curl -s http://wiki.secretgeek.net/best-of-wikipedia | grep 'a href=\"http' | sed -E $'s/^.*<a href=\"([^\"]+)\"[^>]*>([^<]+)<\\/a>.*$/\\\\1	\\\\2/'"
set link_list to every text item of (do shell script get_links_command)

set AppleScript's text item delimiters to tab
repeat
	set link_index to random number from 1 to (length of link_list)
	set {the_url, link_text} to every text item of (item link_index of link_list)
	try
		display dialog "For your entertainment, I hereby suggest to read an article with the title: " & link_text default answer the_url buttons {"Stop this nonsense", "Suggest another one please", "Open URL"} default button 3 cancel button 1 with title "I am bored" with icon note
	on error number -128
		display notification "Sorry I haven't been more entertaining..." with title "My sincerest apologies..."
		exit repeat
	end try
	if button returned of result is "Open URL" then
		do shell script "open " & quoted form of the_url
		exit repeat
	end if
end repeat
