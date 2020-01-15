local function disable_rocket_victory()
	remote.call("silo_script", "set_no_victory", true)
end

-- With control-callbacks-merger
return
{
	-- -- Bootstrap
	{ disable_rocket_victory, "on_init" }      
}