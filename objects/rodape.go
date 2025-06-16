components {
  id: "Parallax"
  component: "/Scripts/Decoration/Parallax.script"
}
components {
  id: "Decoration_Movement"
  component: "/Scripts/Decoration/Decoration_Movement.script"
}
embedded_components {
  id: "sprite3"
  type: "sprite"
  data: "default_animation: \"rodape\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "size {\n"
  "  x: 1280.0\n"
  "  y: 400.0\n"
  "}\n"
  "size_mode: SIZE_MODE_MANUAL\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/main.atlas\"\n"
  "}\n"
  ""
  position {
    z: -9.0
  }
}
