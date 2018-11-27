-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Data (string) to write
local saveData = "Record Mode is On"
local secondLine = "\nThis is SECOND line."
local thirdLine = "\nThis is THIRD line."
local fourthLine = "\nrecordMode = On"
 
-- Path for the file to write
local path = system.pathForFile( "App State Data.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "w" )

local function writeToFile( var )
	if not file then
    	-- Error occurred; output the cause
    	print( "File error: " .. errorString )
	else
    	-- Write data to file
    	file:write( var )
    	-- Close the file handle
    	--io.close( file )
	end
end

writeToFile(saveData)
writeToFile(secondLine)
writeToFile(thirdLine)
writeToFile(fourthLine)
io.close( file )

file = nil

-- Path for the file to read
local path = system.pathForFile( "App State Data.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "r" )
 
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Read data from file
    local contents = file:read( "*a" )
    -- Output the file contents
    print( "Contents of " .. path .. "\n" .. contents )
    -- Close the file handle
    io.close( file )
end
 
file = nil

-- Path for the file to read
local path = system.pathForFile( "App State Data.txt", system.DocumentsDirectory )
 
-- Open the file handle
local file, errorString = io.open( path, "r" )
 
if not file then
    -- Error occurred; output the cause
    print( "File error: " .. errorString )
else
    -- Output lines
    for line in file:lines() do
    	if line == "recordMode = On" then
        	print( "The Fourth Line is: "..line )
    	end
    end
    -- Close the file handle
    io.close( file )
end
 
file = nil