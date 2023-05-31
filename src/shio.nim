import os, re, jester, asyncdispatch, strutils, jsony, times, hashes

type
  Config = object
    useKey: bool
    keys: seq[string]

var cfg = readFile("config.json").fromJson(Config)

if cfg.keys.len == 1 and cfg.keys[0] == "env" and cfg.useKey:
  cfg.keys = getEnv("SHIO_KEYS").split(":")

const fileDir = "public"
createDir(fileDir)

proc genName(fn: string): string =
  return $hash($epochTime() & fn)

routes:
  get "/":
    var html = """
      <h1>
        Shio - The fast personal file server
      </h1>
      To upload a file: curl -X POST -F 'file=@/home/luke/Pictures/tsuki-banner.jpg' -H 'key: <your-key-here>' 
    """ & "http:/" / request.host
    resp(html)

  post "/":
    var fn = request.formData.getOrDefault("file").fields["filename"].splitFile()
    var file = genName(fn.name) & fn.ext
    if (not cfg.useKey) or request.headers["key"] in cfg.keys:
      writeFile(fileDir / file, request.formData.getOrDefault("file").body)
      resp("http:/" / request.host / file)
    else:
      resp("A valid auth key was not provided in the header")
runForever()