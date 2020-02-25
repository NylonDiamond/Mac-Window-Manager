--------------Dock-----------------------
-- Legend {Left, Top, Right, Bottom}
set LtopLeft to {-4480, 23, -3518, 543}
set LtopRight to {-4480, 23, -3518, 543}
set LbottomLeft to {-4480, 551, -3518, 1079}
set LbottomRight to {-3522, 551, -2560, 1079}
set Lfull to {-4480, 23, -2560, 1080}
set LrightHalf to {-3520, 23, -2560, 1031}
set LrightHalf to {-4480, 23, -3520, 1031}

set CtopLeft to {-2560, -337, -1282, 347}
set CtopRight to {-1280, -337, -2, 347}
set CbottomLeft to {-2560, 351, -1282, 1440}
set CbottomRight to {-1280, 351, -2, 1440}
set Cfull to {-2560, -337, 0, 1440}
set nCfullRight to {-1280, -337, 0, 1440}
set nCfullLeft to {-2560, -337, -1280, 1440}

set RtopLeft to {0, 23, 960, 525}
set RtopRight to {960, 23, 1920, 525}
set RbottomLeft to {0, 531, 960, 1033}
set RbottomRight to {960, 531, 1920, 1033}
set Rfull to {0, 23, 1920, 1039}
set RrightHalf to {960, 23, 1920, 1031}
set RleftHalf to {0, 23, 960, 1031}

-------------No Dock-----------------------
set nLtopLeft to {-4480, 23, -3520, 552}
set nLtopRight to {-3520, 23, -2560, 552}
set nLbottomLeft to {-4480, 551, -3520, 1440}
set nLbottomRight to {-3520, 551, -2560, 1440}
set nLfull to {-4480, 23, -2560, 1440} -----------------------------------------------
set nLrightHalf to {-3520, 23, -2560, 1440}
set nLleftHalf to {-4480, 23, -3520, 1440}
set nCtopLeft to {-2560, -337, -1280, 372}
set nCtopRight to {-1280, -337, 0, 372}
set nCbottomLeft to {-2560, 371, -1280, 1440}
set nCbottomRight to {-1280, 371, 0, 1440}
set nCfull to {-2560, -337, 0, 1440}
set nCfullRight to {-1280, -337, 0, 1440}
set nCfullLeft to {-2560, -337, -1280, 1440}

set nRtopLeft to {0, 23, 960, 552}
set nRtopRight to {960, 23, 1920, 552}
set nRbottomLeft to {0, 551, 960, 1440}
set nRbottomRight to {960, 551, 1920, 1440}
set nRfull to {0, 23, 1920, 1440} -------------------------------------------------------
set nRrightHalf to {960, 23, 1920, 1440}
set nRleftHalf to {0, 23, 960, 1440}
------------------------------------------
MoveWindowScripted("Spotify", nRrightHalf)
MoveWindowScripted("PostmanCanary", nRfull)
MoveWindowScripted("Brave Browser Beta", nCfullRight)
MoveWindowScripted("iTerm", nLleftHalf)
MoveWindowScripted("Parallels Desktop", nCfullLeft)
MoveWindowScripted("Ryver", nLrightHalf)
MoveWindowScripted("iTerm", nLleftHalf)

on abs(numericVariable) -- absolute value of a number
	if numericVariable < 0 then
		return -numericVariable
	else
		return numericVariable
	end if
end abs
set abs1 to my abs(item 3 of Rfull)
on MoveWindowScripted(app2move, windowPosition)
	tell application app2move
		--local scriptedApp --scripted app or not?
		-------------
		global abs1
		global abs2
		global absValue
		global c1
		global c2
		global c3
		global c4
		set c1 to item 1 of windowPosition
		set c2 to item 2 of windowPosition
		set c3 to item 3 of windowPosition
		set c4 to item 4 of windowPosition
		set abs1 to my abs(item 3 of windowPosition)
		set abs2 to my abs(item 1 of windowPosition)
		set absValue to my abs(abs2 - abs1)
		try
			activate
			if not (exists window 1) then reopen -- ONLY scripted apps can do this i'm pretty sure
			activate --activate or open if closed
			reopen -- un-minimize if minimized
			set the bounds of the first window to windowPosition
		on error errMsg
			--display dialog errMsg
			if errMsg contains "window 1 doesnÕt understand the ÒexistsÓ message" then -- means it's NON scriptable
				--set windowCoordinates to {{windowPosition}, {}}
				tell application app2move to reopen
				activate -- un-minimize if minimized
				delay 2 --postman sucks and takes a long time to start		
				tell application "System Events"
					tell process app2move to get first window
					set current_window to result
					--activate --activate or open if closed
					--reopen -- un-minimize if minimized
					--set the bounds of the first window to windowPosition
					-- Legend {Left, Top, Right, Bottom}
					set position of current_window to {c1, c2}
					set size of current_window to {(absValue), c4}
				end tell
			end if
		end try
	end tell
end MoveWindowScripted

on MoveWindowNotScripted(app2move, windowPosition)
	tell application app2move to reopen
	activate -- un-minimize if minimized
	delay 2 --postman sucks and takes a long time to start
	tell application "System Events" to tell application process app2move
		get {size, position} of window 1
		--get the bounds of the first window
		--set the size of front window to {960, 1057}
		activate --activate or open if closed
		reopen -- un-minimize if minimized
		--set tt to get {size, position} of window 1
		
		-- set the bounds of the first window to {-3520, 551, -2560, 1080}
		tell window 1 to set {size, position} to {{1920, 1008}, {0, 23}}
		-- tell window 1 to set {size, position} to {{1920, 1008}, {0, 23}}
	end tell
end MoveWindowNotScripted