if not mods["RecipeBook"] then
  return
end

recipe_book.set_group_with(data.raw["container"]["kr-shelter-container"], data.raw["item"]["kr-shelter"])
recipe_book.set_alternative(
  data.raw["container"]["kr-shelter-plus-container"],
  data.raw["container"]["kr-shelter-container"]
)
recipe_book.set_alternative(data.raw["item"]["kr-shelter-plus"], data.raw["item"]["kr-shelter"])
recipe_book.set_group_with(data.raw["item"]["wood"], data.raw["recipe"]["kr-grow-wood-with-water"])
recipe_book.set_group_with(data.raw["resource"]["imersite"], data.raw["item"]["raw-imersite"])
recipe_book.set_group_with(data.raw["resource"]["rare-metals"], data.raw["item"]["raw-rare-metals"])
recipe_book.set_hidden(data.raw["recipe"]["nuclear-fuel"], true)
recipe_book.set_hidden(data.raw["item"]["nuclear-fuel"], true)
