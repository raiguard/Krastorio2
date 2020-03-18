local patreons_list = {}

-- Patreon how donate 10 or more dollars
patreons_list.high_supporters =
{
	{"Aski Rawen", 10},
	{"Austin", 10},
	{"Jonas Rejman", 10},
	{"Josh Strunk", 10},
	{"Rivsung", 10},
	{"Saulius Zilis", 10},
	{"ReysDad", 10},
	{"Константин Попичев", 10},
	{"Сергій Руденко", 10},
	{"Jan Dragsbæk", 6},
	{"rcobbe", 6}
}

-- Patreon how donate 9 or less dollars
patreons_list.low_supporters =
{
	"Andrew VonHandorf", 
	"Austin",
	"billbo99",
	"Charles Paquin", 
	"Chosen", 
	"Dirk M", 
	"jmsantos94", 
	"Jonas Rejman",  
	"Kai-Chi Huang",
	"Kartikay Bagla", 
	"Marco Montemarani", 
	"MisterRusty", 
	"Niv", 
	"Nozoki", 
	"Pavlo Bulanchuk", 
	"Peter Zelenay", 
	"peter50216", 
	"Raymond Lau", 
	"Ryan", 
	"Ryan Barker", 
	"Shafnir", 
	"Simon Harvey", 
	"srdis", 
	"Zoey Oliva", 
	"Влад", 
	"Сергей Ложкин"
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
