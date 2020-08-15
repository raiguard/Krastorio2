local patreons_list = {}

-- Top Supporters
patreons_list.high_supporters =
{
	"Chris Höppner",
	"Brayden McLean",
	"bob",
	"James Kelley",
	"John Wrangle",
	"Senard",
	"Chris Hazen",
	"Egdod",
	"Josh Strunk",
	"Andromeda Fallen",
	"Andrew Deren",
	"Aski Raven",
	"Austin",
	"Dmitrii",
	"George Simpson",
	"GeneralTank",
	"Jonas Rejman",
	"Jan Šipr",
	"lordfiSh",
	"Ivan Devyatko",
	"Mark Harrison",
	"Maximilian Bork",
	"Matt Tyler",
	"Koshirun Treebone",
	"Konstantin Popichev",
	"ReysDad",
	"Rivsung",
	"Russell Obets",
	"Saulius Zilis",
	"Сергій Руденко",
	"Alright",
	"George Elliott-Hunter",
	"Jan Dragsbæk",
	"rcobbe",
	"donut7163",
	"circk",
	"dr.feelgood999",
	"DarkStroker",
	"Vladimir Kravtsov",
	"Windsinger",
	"Tobi",
	"Arun Bhat",
	"Zoey Oliva",
	"sollevix"
}

-- Patreon how donate 9 or less dollars
patreons_list.low_supporters =
{
	"Andrew Spade",
	"Adrian Leonhard",
	"billbo99",
	"Chanz",
	"craig a",
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
	"Niv",
	"Nozoki",
	"Pavlo Bulanchuk",
	"Peter Zelenay",
	"peter50216",
	"Paweł G.",
	"Raymond",
	"Ryan Barker",
	"Seleck",
	"Shafnir",
	"Simon Harvey",
	"Srdis",
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
	"Wolfgang Weber",
	"webchip",
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

	for _, name in pairs(patreons_list.high_supporters) do
		table.insert(overall_list, name)
	end
	
	for _, name in pairs(patreons_list.low_supporters) do
		table.insert(overall_list, name)
	end
	
	return overall_list
end

return patreons_list
