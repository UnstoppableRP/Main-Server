fx_version 'bodacious'
games { 'rdr3', 'gta5' }

author 'PixelRez'
description 'Unity Doors'
version '1.0.0'

-- dependency "ethical-"
dependency "ghmattimysql"

shared_script "shared/sh_doors.lua"

server_script "server/sv_doors.lua"
client_script "client/cl_doors.lua"

server_export 'isDoorLocked'