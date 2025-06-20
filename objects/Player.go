components {
  id: "Player"
  component: "/Sprites/Player/Player.sprite"
}
components {
  id: "Player_Actions"
  component: "/Scripts/Player_Actions.script"
}
components {
  id: "Player_Movement"
  component: "/Scripts/Player_Movement.script"
}
components {
  id: "Player_Actions1"
  component: "/Scripts/Player_Actions.script"
}
embedded_components {
  id: "Shield"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"shield\"\n"
  "mask: \"default\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_BOX\n"
  "    position {\n"
  "      y: 26.0\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 3\n"
  "    id: \"action\"\n"
  "  }\n"
  "  data: 20.0\n"
  "  data: 4.0\n"
  "  data: 10.0\n"
  "}\n"
  ""
}
embedded_components {
  id: "life"
  type: "collisionobject"
  data: "type: COLLISION_OBJECT_TYPE_TRIGGER\n"
  "mass: 0.0\n"
  "friction: 0.1\n"
  "restitution: 0.5\n"
  "group: \"life\"\n"
  "mask: \"default\"\n"
  "embedded_collision_shape {\n"
  "  shapes {\n"
  "    shape_type: TYPE_BOX\n"
  "    position {\n"
  "    }\n"
  "    rotation {\n"
  "    }\n"
  "    index: 0\n"
  "    count: 3\n"
  "    id: \"Life\"\n"
  "  }\n"
  "  data: 20.0\n"
  "  data: 20.0\n"
  "  data: 10.0\n"
  "}\n"
  ""
}
