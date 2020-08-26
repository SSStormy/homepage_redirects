-- Requires LuaFileSystem (luarocks)

require("lfs")
require("common")

local output_path = "../output"

SITE_PATH = nil
IS_RELEASE = false

for _, v in pairs(arg) do
  if v == "--release" then
    IS_RELEASE = true
  end
end

if IS_RELEASE then
  SITE_PATH = "https://justas-d.github.io/"
else
  SITE_PATH = "http://localhost:5000/"
end

os.execute("rm -rf " .. output_path .. "/*")
os.execute("mkdir -p " .. output_path)

local function output_file(name, buf)
  local fd = assert(io.open(output_path .. "/" .. name, "w"))
  fd:write(buf)
  fd:close()
end


local function generate_redirection(path, redirect_to)
  local split_path = string_split(path, "/")
  local only_dirs = string_concat(array_slice(split_path, 1, #split_path - 1), "/")

  local content = concat([[
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="refresh" content="0; url=]],redirect_to,[[" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Justas Dabrila</title>
  </head>

  <body>
    <a href="]],redirect_to,[[">If you are not being redirected, click here.</a>
  </body>
</html>
  ]])

  os.execute("mkdir -p " .. output_path .. "/" .. only_dirs)
  output_file(path, content)
end

generate_redirection("puzzles/two-slitherlink.html", SITE_PATH .. "two-slitherlinks-1")
generate_redirection("puzzles/two-slitherlink/index.html", SITE_PATH .. "two-slitherlinks-1")
generate_redirection("puzzles/two-slitherlink2.html", SITE_PATH .. "two-slitherlinks-2")
generate_redirection("puzzles/two-slitherlink2/index.html", SITE_PATH .. "two-slitherlinks-2")
generate_redirection("two-slitherlinks-1.html", SITE_PATH .. "two-slitherlinks-1.html")
generate_redirection("two-slitherlinks-2.html", SITE_PATH .. "two-slitherlinks-2.html")
generate_redirection("coffee.html", SITE_PATH .. "coffee.html")
generate_redirection("index.html", SITE_PATH .. "index.html")
generate_redirection("nimblefox.html", SITE_PATH .. "nimblefox.html")
generate_redirection("games/p-grappler/index.html", SITE_PATH .. "games/p-grappler/index.html")

generate_redirection("tetris-fill/index.html", SITE_PATH .. "tetris-fill/index.html")
generate_redirection("tetris-fill.html", SITE_PATH .. "tetris-fill/index.html")
generate_redirection("pull/index.html", SITE_PATH .. "pull/index.html")
generate_redirection("pull.html", SITE_PATH .. "pull/index.html")
generate_redirection("height/index.html", SITE_PATH .. "height/index.html")
generate_redirection("height.html", SITE_PATH .. "height/index.html")
generate_redirection("breakout/index.html", SITE_PATH .. "breakout/index.html")
generate_redirection("breakout.html", SITE_PATH .. "breakout/index.html")
generate_redirection("book/index.html", SITE_PATH .. "book/index.html")
generate_redirection("book.html", SITE_PATH .. "book/index.html")

generate_redirection("roll20-enhancement-suite.html", SITE_PATH .. "roll20-enhancement-suite/index.html")
generate_redirection("roll20-enhancement-suite/index.html", SITE_PATH .. "roll20-enhancement-suite/index.html")
generate_redirection("roll20-enhancement-suite/chrome.html", SITE_PATH .. "roll20-enhancement-suite/chrome.html")
generate_redirection("roll20-enhancement-suite/contribute.html", SITE_PATH .. "coffee.html")
generate_redirection("roll20-enhancement-suite/features.html", SITE_PATH .. "roll20-enhancement-suite/features.html")
