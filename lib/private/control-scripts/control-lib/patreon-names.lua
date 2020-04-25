local patreons_list = {}

-- Patreon how donate 10 or more dollars
patreons_list.high_supporters =
{
	{"Chris Höppner", 20},
	{"James Kelley", 20},
	{"Senard", 20},
	{"Chris Hazen", 15},
	{"Egdod", 15},
	{"Josh Strunk", 15},
	{"Andrew Deren", 10},
	{"Aski Rawen", 10},
	{"Austin", 10},
	{"George Simpson", 10},
	{"Jonas Rejman", 10},
	{"lordfiSh", 10},
	{"Mark Harrison", 10},
	{"Matt Tyler", 10},
	{"Konstantin Popichev", 10},
	{"ReysDad", 10},
	{"Rivsung", 10},
	{"Russell Obets", 10},
	{"Saulius Zilis", 10},
	{"Alright", 6},
	{"George Elliott-Hunter", 6},
	{"Сергій Руденко", 6},
	{"Jan Dragsbæk", 6},
	{"rcobbe", 6}
}

-- Patreon how donate 9 or less dollars
patreons_list.low_supporters =
{
	"Andrew Spade",
	"billbo99",
	"Chosen",
	"Daniel Vollmer",
	"Dirk M",
	"Donny",
	"Gareth Knowles",
	"Kai-Chi Huang",
	"Kartikay Bagla",
	"Niv",
	"Nozoki",
	"Pavlo Bulanchuk",
	"Peter Zelenay",
	"peter50216",
	"Raymond",
	"Ryan Barker",
	"Shafnir .",
	"Simon Harvey",
	"srdis",
	"Zoey Oliva",
	"Сергей Ложкин",
	"Charles Paquin",
	"Dang Quang",
	"Hackerman",
	"jmsantos94",
	"Marco Montemarani",
	"Mopolo",
	"Raymond Lau",
	"Ryan",
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
