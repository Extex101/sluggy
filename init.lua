--= Sluggy for Creatures MOB-Engine (cme) =--
-- Copyright (c) 2015-2016 BlockMen <blockmen2015@gmail.com>
--
-- init.lua
--
-- This software is provided 'as-is', without any express or implied warranty. In no
-- event will the authors be held liable for any damages arising from the use of
-- this software.
--
-- Permission is granted to anyone to use this software for any purpose, including
-- commercial applications, and to alter it and redistribute it freely, subject to the
-- following restrictions:
--
-- 1. The origin of this software must not be misrepresented; you must not
-- claim that you wrote the original software. If you use this software in a
-- product, an acknowledgment in the product documentation is required.
-- 2. Altered source versions must be plainly marked as such, and must not
-- be misrepresented as being the original software.
-- 3. This notice may not be removed or altered from any source distribution.
--
local def = {
  -- general
  name = "creatures:sluggy",
  stats = {
    hp = 50,
    lifetime = 600, -- 10 Minutes
    can_jump = 1,
    can_swim = false,
    can_burn = true,
    has_falldamage = false,
    has_kockback = true,
    hostile = true,
  },

  modes = {
    idle = {chance = 0.7, duration = 3, update_yaw = 6},
    walk = {chance = 0.3, duration = 5.5, moving_speed = 1.5},
    -- special modes
    attack = {chance = 0, moving_speed = 3.5},
  },

  model = {
    mesh = "sluggy.b3d",
    textures = {"creatures_sluggy.png"},
    collisionbox = {-0.25, -0.01, -0.3, 0.25, 0.45, 0.3},
    rotation = 90.0,
    animations = {
      idle = {start = 0, stop = 23, speed = 24},
      walk = {start = 23, stop = 36, speed = 24},
      attack = {start = 36, stop = 43, speed = 24},
      death = {start = 44, stop = 46, speed = 28, loop = false, duration = 2.12},
    },
  },

  sounds = {
      on_damage = {name = "creatures_happy_hit", gain = 0.4, distance = 10},
      on_death = {name = "creatures_happy_death", gain = 0.7, distance = 10},
      swim = {name = "creatures_splash", gain = 1.0, distance = 10},
      random = {
        idle = {name = "creatures_happy", gain = 0.7, distance = 12},
      },
  },

  combat = {
    attack_damage = 1,
    attack_speed = 0.6,
    attack_radius = 1.1,

    search_enemy = true,
    search_timer = 2,
    search_radius = 12,
    search_type = "player",
  },

  spawning = {
    abm_nodes = {
      spawn_on = {"default:stone", "default:dirt_with_grass", "default:dirt",
        "default:cobblestone", "default:mossycobble", "group:sand"},
    },
    abm_interval = 36,
    abm_chance = 7600,
    max_number = 1,
    number = 2,
    light = {min = 0, max = 8},
    height_limit = {min = -200, max = 50},

    spawn_egg = {
      description = "Sluggy Spawn-Egg",
      texture = "creatures_egg_sluggy.png",
    },

    spawner = {
      description = "Sluggy Spawner",
      range = 8,
      number = 6,
      light = {min = 0, max = 8},
    }
  },
}

creatures.register_mob(def)
