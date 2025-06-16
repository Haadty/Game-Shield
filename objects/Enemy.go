components {
  id: "Enemy_Intro"
  component: "/Scripts/Enemy_Intro.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"static\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/Sprites/Enemy/Enemy.tilesource\"\n"
  "}\n"
  ""
}
