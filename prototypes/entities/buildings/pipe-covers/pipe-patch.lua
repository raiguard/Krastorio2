local empty_sprite = {
  filename = kr_entities_path .. "empty.png",
  priority = "high",
  width = 1,
  height = 1,
  scale = 0.5,
  shift = { 0, 0 },
}

kr_pipe_path = {
  north = empty_sprite,
  east = empty_sprite,
  south = {
    filename = kr_entities_path .. "pipe-patch/pipe-patch.png",
    priority = "high",
    width = 28,
    height = 25,
    shift = { 0.01, -0.58 },
    hr_version = {
      filename = kr_entities_path .. "pipe-patch/hr-pipe-patch.png",
      priority = "high",
      width = 55,
      height = 50,
      scale = 0.5,
      shift = { 0.01, -0.58 },
    },
  },
  west = empty_sprite,
}
