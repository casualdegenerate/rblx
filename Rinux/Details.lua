-- / I said, if you don't tell me what happened your moms a hoe
local a,err = pcall(function()
	local o = {""} -- / Variable name stands for output

	local function append(a) -- / Because this shit can't use luau I'd have to compromise
		o[1] = o[1]..a.."\n"
	end

	-- / Artistic expresion pog?
	append(
		[=====[
...................................##@##@@@###............................................................................................................
.................................##0NAHfKffsHWqNRD&gQBB##...........................##@@#.................................................................
................................#@EKIFIIIFFFIIIIIIIIFFUK3NR&QBB#................##BBBBBBB##...............................................................
................................#@BIKIFFFIIFFFFFIIFFIIIIFIIIIFIH5DgQ#.......#@BRWKUFFFFUFfP5RE8QB#........................................................
.................................#@RFIIIIIKIFFFFFFFFFIIIIIIIIIIIIFFIFPd&Q##@#@0IFIIIIIIIIIIIIIIFFfAd&QB##@#...............................................
..................................#@gfFIIIIIFFFFFFFFIIIIIIIIFFK35dR0E&&&&&&Q##@#Q&NfFIIIIIIFIIIIIIIIIIFs508B#@###.........................................
...................................#@#5UKIFFFFFFFFFFIIIFIIsRQ###BQQ8g&&&&gg8QB##@@@@B&AIFIIIIIFFFFIIIIFIFFfHq0Q#..........................................
.....................................#@QPFFFIFIIFFFFIIIIK&##E5sFUFIIIIIIIFIIFFIIKPNDgB##QDAIFFIIIFIFFsdgB####BBQBB##......................................
.......................................##BSFIIIFIFFIIFIFg@9UIFIIFFFFFFFFFFFFFFFIIIKIIIIsd8#@B&AFFKFR##8RWKFFFFFIFFIIFKWR8#@@@#............................
........................................###QSFFIIIIIIFFU8@RIIFIIFFFFFFFFFFFFFFFIIIIIFFFFIIKq&#@#EaUK3IIUFIIFFIIIIIIKIFFIFKbQ#@##..........................
...........................................##QNIIFFIIFIFP##aIIIIIFFFFFFFFFIIIIIIIIIIFFIIIFIIFFPEB#QRfFKIIIFFFFIIIIIFIKN&###BBQBB##........................
............................................###BNIKKFIKIIH5KKIIFFFFFFFFFFFIIIIIIIIIFFIPNR&gQQQQQQQ#@#8qFIIIFFFIIFFFqg##8NsIKIfANRg#.......................
.................................................BdIFKIFIKIIFIIFFFFFFFIIIIIIIIFIFHd&B##BQgERddddREgQ#@@QNKFFFIIKFqQ#QNKFFa9Q#B&5sIfARQ@#..................
...................................................#SFIIIIIFFIFFFFFFFFIIIFIIFsd8##BgRWFKIFFFFKfssfKFUfNQ##RfIIIHQ@QAFIKNB#5]!`        -)A#................
.....................................................QPIIFIFFFFFFFFFFIIIKIHDQ##gNfFUfqDgQB#BBQ8888QBBBQER8##Dfd##dFIKd#Bx.       `::-    ;5##.............
.......................................................0FIIFFFFFFFFFIIKUd##8bfII30Q#gPY*:.`          ':vk9#@@@@&IIKR#8|`      'lB@@@@@&Y'  -j##...........
....................................................#@#@RUIFFFFFFFFFFIKI35fIIINQ#Nx_                      .|P##dKsQ#c`       .D@@@@@@8Q@Q-   !&...........
....................................................#0W#BIIFFFFFFFFFIFIIIIUFbB#k_                            -l###Q;         k@@@@@#~  *Bg_   .5##........
.................................................##8sFK##fIFFFFFFFFFFIIIIH&#Bk-                 .r}cu|-        !8@|         `&@@@@@8`   l@q    `a@#.......
................................................B0sFIF5@QUIFFFFFFFFFFIKIFb@d.                 .k#@@@@@#y-       :Q&-        `g@@@@@@z. .d@@=    `S@#......
.............................................#&AUFIIIIsdHIIFFFFFFFFFFIIFIF&@y`               .R@@@@@#AW#Q~       *#f         K@@@@@@@#8#@@@v     "#@#.....
..........................................#g5KFKIIFFFIIIIIIFFFFFFFFFFIIFIII&@2`              c@@@@@Q_  :8#!       K@>        :#@@@@@@@@@@@@r      0@#.....
......................................##g5IFIIIFIFFFIIIIIIIFFFFFFFFFFFFFFFIK&@u             `&@@@@@A    x@b       !#3         *#@@@@@@@@@@&'     -B@@#....
...................................#QdsIIFIIFIIIIIIIFIFFFFFFFFFFFFFFFFFFFIIKF8@r            `&@@@@@#v  `W@#!       N#,         -K#@@@@@@@R-     _0#b#.....
................................#QRKIIIIIIIFFFFFFIIIFFFFFFFFFFFFFFFFFFFFFIIIFW@d             o@@@@@@@gAQ@@@=       l@x           ,}N8BQNi`    -uB#qK#.....
...........................###8dfUIKIIIIIIIIIIIIIIFFIIFFFFFFFFFFFFFFFFIIIIIIIUQ@>            "B@@@@@@@@@@@8'       l@#I:                  `:]5#BRKU0@#....
.........................##gNKFIIIIIIIIFFIFIFFFIIIIIIIFFFFFFFFFFFFFFIIIIIFIFIIA@R`            ;B@@@@@@@@@@\       -Q@@@#q7~-`       ',;vydQ#QD3FIA8.......
....................#@##&qIFIKIIIIFIIFHbEgQBBBBQQ&RPIIFFFFFFFFFFFFFFIKFssIIIIIF0@j`            ,A@@@@@@@B\       .R#8@8f98BBQ8&EE&8QBBB8&NHFIPdg###.......
..................##BEWFIIIIIFIIFFIFA##B8ERb55Nd9&Q&UIFFFFFFFFFIIIIFIKKQ#RFIIFIK&@f'             :}A0E5x.       ^8#R##AFFFFFfHPAq5Sqq5dD&8Q###BgQ@#.......
................##EWFFFFIFFIFFFFIIIIIaKFFFIIIIIFIFUIKIIIIFFFFFFIIIIIFIKsg@B5IIIKKd#Qv`                       `rb#8d##NFIIIFFIUd######BQQg0d5sIIKF5#@#.....
...........#@#B9HFIIIFIFFFFFFFFFIFFFIIIFIIFIKIFFIFFIFFIFFFFFFFFIFIIIIIFIIsE##gAFUFKdQ#K|_`              `:)k&#QR9B#&sIKFIIIIIIIFUFIIFIFFIFFIIIIFKIK&@#....
.........###gWUFIFIIIFFFFFFFFIFFFIIFFsd&QB######Qg9AIIIIFIIFFFFIFFIFFKIIFFUfRQ##&NfUFH&Q#Q0Wjcn}}}1yjHbgB#QERR8##&aIIIIFFIFFFFIIFIFIFFIIIFIIIFIIIFFsQ@#...
........##gsFIFFIFFIFFFFFFFFFIIIIIIDB#B&dAsUtjFH5DQ##&qFIIIIIIIIIFFFIIK8#gdHFUsd8##B805HKsqdRE&&&&&ERdddREQ##B&5IFIIIFFFIFFFFFFFFFFFFFFFIIIIIIIIA&B#BgB...
........BWFIIIIIIIFFFFFFFFFIFIIFId##RIkkkkkkkkkkkkk2N8##&WIIIFIIIFFIIIIfNgB##QENsFsbE8B####BQQQQQQBB##@@@#gNfUFIIIIIIFFFFFFFFFFFIFFFIIIIFIIIKNg##8dIkk0...
.....#@&KKFIFFFIFFFFFFFFFFIIIFIHQ@&2kkkkkkkkkkkkkkkkkkoNQ#QdfFFIIIIIIFIFIIFf5E8B##BQ&0bSq5NdRD&&8QB####&5KIIIFIFFFFFFFFFFFFFFFIFIFFFFIIIFaRQ##&qjkkkkd##..
....#@RUFIIFFFFFFFFFFFFFFFFIIIa##Skkkkkk2fK2kkkkkkkkkkkkksE##gAFFIKIFIIIIIIIIFIFIaN9&8BB########BQgD5sFIFFFFFFFFFFFFFFFFFFFFFFIIIFFIFK5EB#QDskkkkkk3Q##...
...#@DUIIFIIFFFFFFFFFFFFFFFIIKQ@5ykkkkKg####QN2kkkkkkkkkkkkt5Q#BDHFFIFIIIIFIIIIIIIFFIIIIFUUUFUFFIFIFFIFIIIIFIIIFFFFFIFIIIIIIFFFIFKSEQ##8dokkkkkk25Q##.....
..#@gFIIFIIIFFFFFFFFFFFFFFFIF9@&kkkkk2B#RAA5&##8Wkkkkkkkkkkkkktqg##gNIFIIFIIIFIIIIIIIIIIIIIIIIIIIIIIIFFFFIFFFFIIIFIIIIIIFIIIad&Q##Q0WjkkkkkkkFdQ##........
..##HIIFFIIIFFFFFFFFFIIFFFIIFQ@AkkkkkK##qWAqAARQ#BEskkkkkkkkkkkkktSg##8RaIIIIIIFIIFIIIFFFIIIIIIIIIIIFIFFFIIIIIIIIFIIFFfWRgQ##B&bskkkkkkkkkHRQ#............
#@8zIIFFFFFFFFFFFFFFIIFFFIIFQ@Hkkkkkj##NAAAAAAA5EB#QRs2kkkkkkkkkkkk2q&B##QEb3KIIIIIIIFIIIIIIIIIIIIIIIIIIFIIIFIsAd0gQ###QENs2kkkkkkkkkIN&###...............
#@RUKFFFFFFFFFFFFFFFFFFFFIIF8@5kkkkkkR@QqAAAAAAAAA5&B##gds2kkkkkkkkkkkkjPRgB###Qg&9d5WHsfKIFIIKKsH3A5bR0&gQB####Qg0NaokkkkkkkkkkjWR8##B###................
#@RFIIFFFFFFFFFFFFFFFIFFFIIUd@gkkkkkkt8@gqAAAAAAAAAAAqRgB##QE5KkkkkkkkkkkkkkkF3NR&8QB###############BQ8gERbqHF2kkkkkkkkkkk2f5D8B#B8RWjktQ.................
#@0UIIFFFFFFFFFFFFFFFFFFFFIFKB@qkkkkkk2&@#05AAAAAAAAAAAAqSd&QB##Q&dWjkkkkkkkkkkkkkkkkkkk2ttttt2kkkkkkkkkkkkkkkkkkkkkjs508BBQRHg@Rkkkkkkks##...............
#@QzIIFFFFFFFFFFFFFFFFFFFFIIIW##skkkkkkk5#@##BQQQQBB##BBQ8&R5ASd08Q##BQ&R5aF2kkkkkkkkkkkkkkkkkkkkkkkkkkkkk2ofWNR&8BBB8RU})=,_,*#BkkkkkkkS@#...............
..#@AUIFFFFFFFFFFFFFFFFFFFFIKKFq##PkkkkkkkoD#@&2uu}Yv/|/x}j58##Q05AAA5dEgQB####BQ8g&0RddN555555NbdR90&gQQBBBQ8ENsyi)~:__,_,__"v&#NkkkkkkP#................
..##BsIIIFIIFFFFFFFFFFFFFFIIIIFFs8@R2kkkkkkkkWg#gjr:,________,;}qQ#QEqAAAAAAAAq5bR90&&g888QQQ8888gg&&##*=:,____,________,,^nd#BRokkkks0###................
...#@QfIIIIIFFFFFFFFFFFFFFFIIIFIKId#Bqkkkkkkkkkj5g#QHi^:_,,___,_,:|jg#Q9SAqAAAAAAAAAAAAAAAAAAAAAAAAA5B@!_____________:*}5Q#QRs2kktq&B##...................
....#@QsIFFIIIFFFFFFFFFFFFFFFFIIFIKP8#BNjkkkkkkkkk2s0Q#Q0Hcx^:,,,,__,vsQ#QD5AAAAAAAAAAAAAAAAAAqAA50Q#Qi,,_____,:^xyA&BBQRH2kkUSEQ#@#......................
.......#5IIFFIFFFFFFFFFFFFFFFFFFIFIII3&##&akkkkkkkkkkkkKq9gQBB80qzlx|=::)Kg#B8ERNAAAAAAAAASNRE8Q#BEKv:,!;|YysdgBBQ&RWokkj3RgB#............................
.......#@8HFIKIIIIFFFFFFFFFFFFFFIIIIIFIKN8##g5okkkkkkkkkkkkkk2fAd0gQBBBQg0d0Q#@@@##########@@@#8RP3NR&QBBBQ&R5sjkkkzWd&B#.................................
........###&HIIFFIFFFFFFFFFFFFFFFFFFFFIIIFKNg##B&5Kkkkkkkkkkkkkkkkkkkk2FsW5dR0&&g8QQQQQQQQQQ88g&EDdNAHK2kkkk2KAd&Q####@@#.................................
..........###8SIFFIFFIFFFFFFFFFFFFFFFIIFFFFIIFHRgB##805sjkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjs5R&QB##BQ&&8B#@@#..................................
...............#QRKFFIIIIIIIFFFFFFFFFIIIIFIIFIFFIIUK5DgQ###BQ&0d5WsKo2kkkkkkkkkkkkkkk2jUfHA5dD&8QB###BQg0dAfsdgB#.........................................
..................#QRPFFIIIIFFFFIFFFFFFFFFFFFIIIIIIIIIIFUKH5R0&8QB#########BBBBBB#########BQ8g&Dd53fFFFKA98B#@@#..........................................
....................###Q0NsFIIIIIKIFFIIIIIIIIFIIIIFIIIIFFIIIIIIIIFUzFKsHPWAqqqqqAWPHsfKFFFFIIIFIIFKAR&Q#..................................................
.......................#####Q&RSsIFFFIIIIIIIIIIIIIIIIIIFFFFFFFFIIFFFIIIIIIIIIIIIIIIIIIIIFIFK3N9gQ##.......................................................
................................#BBQ&Dd5WsFUFIIIIIIIIIFFFIIIIIIIIIIIIFFFFIKKIIFFFFKHqND&8B##..............................................................
........................................##BBBBQQ8&&ERRdbNN5SqqqqqS55NddRR0&&8QQBBB##......................................................................
...............................................#@@@#@@##@@@@@@@@@@@@@#@@@#@@@@@#..........................................................................
]=====]
	)

	--[[ -- / This is a depricated canvas for testing
	append(
		(function()
			local o = ""
			for y=1,24 do
				for x=1,64 do
					o = o.."/x"
				end
				o = o.."\n"
			end
			return o
		end)()
	)
	--]]





	-- / Name of the file
	append("Details.lua")
	-- / Something to start with
	append("Place Id: " .. game.PlaceId)
	-- / People call this a Job Id or Server Id, I'd just call it a GUID or Server GUID
	append("Server GUID: " .. game.JobId) 
	-- / This property is depricated I think, but it helps me understand the size of a game, if I were in a slow pace working on it. COUGH COUGH
	-- / Update note! (6/2/2021?) That depricated property does not even work on game anymore hhhhhh(or it just never did)
	append("Game data: " .. #game:GetDescendants())
	-- / This is your execution level. So whatever is running this will be the level, and I'm still trying to understand the game with the tools it gave me. I know I can easily look at it through *other* tools, but this is a lot more fun (i feel like a hakzor man)
	append("Level: " .. 
		(function() -- / At least I'm not like some people who make this one line.
			if script.ClassName == "Script" then
				return "Server" -- / Self explanatory
			elseif script.ClassName == "LocalScript" then
				return "Client"
			elseif script.ClassName == "Module" and game:GetService("Players").LocalPlayer then -- / I want to lynch myself
				return "Module/Client"
				else
	return "Module/Server?"
end
end)()
)
-- / This is so it can tell if it it were called on the client side or not.
if script.ClassName == "LocalScript" or script.ClassName == "ModuleScript" and game:GetService("Players").LocalPlayer then
	append("Client: " .. game:GetService("Players").LocalPlayer.Name)
else
	append("Client: " .. table.concat(game:GetService("Players"):GetPlayers(), ","))
end
-- / So we can give the server some sort of name :/
-- / Another quick note. I will make a text file later full of names for the server to pick
-- / PLAN Make a list of names, and make a random.seed for the game.JobId's digits and use that to name the server. So if you were to run my script on the same server it will have the same name. And other servers have different names. :3
-- / I have modded the code here, so you can get the name of the server without it being ran on it, but since it tells you up above how it's being called it's alright.

-- / This is so that server's would have a static name
math.seed(game.JobId:gsub("%D","")[1])
-- / I only have names of friends because I could not think of anything else
local names = {"Casual", "NekO", "Matrix"}
append("Server: " .. names[math.random(1,#names)])




-- / Did both because I can
warn(o[1]) 
return o[1]
end)

-- / Like I said, your moms a hoe
if err then
	warn(err)
	return err
end

