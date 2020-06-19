local patreons_list = {}

-- Patreon how donate 10 or more dollars
patreons_list.high_supporters =
{
	{"Chris Höppner", 20},
	{"bob", 20},
	{"James Kelley", 20},
	{"John Wrangle", 20},
	{"Senard", 20},
	{"Chris Hazen", 15},
	{"Egdod", 15},
	{"Josh Strunk", 15},
	{"Andromeda Fallen", 10},
	{"Andrew Deren", 10},
	{"Aski_Raven", 10},
	{"Austin", 10},
	{"George Simpson", 10},
	{"GeneralTank", 10},
	{"Jonas Rejman", 10},
	{"lordfiSh", 10},
	{"Ivan Devyatko", 10},
	{"Mark Harrison", 10},
	{"Matt Tyler", 10},
	{"Konstantin Popichev", 10},
	{"ReysDad", 10},
	{"Rivsung", 10},
	{"Russell Obets", 10},
	{"Saulius Zilis", 10},
	{"Сергій Руденко", 10},
	{"Alright", 6},
	{"George Elliott-Hunter", 6},
	{"Jan Dragsbæk", 6},
	{"rcobbe", 6},
	{"donut7163", 10},
	{"circk", 10},
	{"dr.feelgood999", 10},
	{"DarkStroker", 10},
	{"Windsinger", 25},
	{"sollevix", 10}
}

-- Patreon how donate 9 or less dollars
patreons_list.low_supporters =
{
	"Andrew Spade",
	"billbo99",
	"Chanz",
	"Charles Paquin",
	"Chosen",
	"Dang Quang",
	"Daniel Vollmer",
	"Deterlo",
	"Dirk M",
	"Donny",
	"Gareth Knowles",
	"JustSoul",
	"Kai-Chi Huang",
	"Kartikay Bagla",
	"Loïc Gremaud",
	"Maximilian Bork",
	"Niv",
	"Nozoki",
	"Pavlo Bulanchuk",
	"Peter Zelenay",
	"peter50216",
	"Raymond",
	"Ryan Barker",
	"Seleck",
	"Shafnir",
	"Simon Harvey",
	"Srdis",
	"Zoey Oliva",
	"Сергей Ложкин",
	"Charles Paquin",
	"Dang Quang",
	"Hackerman",
	"Igor Borisov",
	"jmsantos94",
	"Marco Montemarani",
	"Mopolo",
	"Raymond Lau",
	"Ryan",
	"Showwin",
	"Tobi",
	"Влад"
}

function patreons_list.getHighSupportersList()
	return patreons_list.high_supporters
end

function patreons_list.getLowSupportersList()
	return patreons_list.low_supporters
end

function patreons_list.getOverallSupportersList()
	local overall_list = {}

	for _, donation in pairs(patreons_list.high_supporters) do
		table.insert(overall_list, donation[1])
	end
	
	for _, name in pairs(patreons_list.low_supporters) do
		table.insert(overall_list, name)
	end
	
	return overall_list
end

return patreons_list
