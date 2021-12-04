ETHICAL.Admin:AddRank("owner", {
    inherits = "dev",
    issuperadmin = true,
    allowafk = true,
    grant = 101
})

ETHICAL.Admin:AddRank("dev", {
    inherits = "spec",
    issuperadmin = true,
    allowafk = true,
    grant = 100
})

ETHICAL.Admin:AddRank("spec", {
    inherits = "admin",
    issuperadmin = true,
    allowafk = true,
    grant = 99
})

ETHICAL.Admin:AddRank("admin", {
    inherits = "moderator",
    allowafk = true,
    isadmin = true,
    grant = 98
})

ETHICAL.Admin:AddRank("moderator", {
    inherits = "trusted",
    isadmin = true,
    grant = 97
})

ETHICAL.Admin:AddRank("trusted", {
    inherits = "user",
    isadmin = true,
    grant = 96
})

ETHICAL.Admin:AddRank("user", {
    inherits = "",
    grant = 1
})