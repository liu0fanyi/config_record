#... other setting

## StarShip
## ------------------------------------
$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "
## ------------------------------------
## StarShip

## set editor
## ------------------------------------
$env.EDITOR = "helix"
## ------------------------------------
## set editor

## fastgit
## ------------------------------------
alias fastgit = fastgit
def fastgit [] {
   git add .;git commit -m "update"; git push
}
## ------------------------------------
## fastgit

## yazi can use y to open yazi and change current dir when quit
## ------------------------------------
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}
## ------------------------------------
## yazi can use y to open yazi and change current dir when quit

## add fnm for npm version controll
## ------------------------------------
# $env.PATH = ($env.PATH | prepend "/home/liu/.local/share/fnm")

# load-env (fnm env --shell bash
#     | lines
#     | str replace 'export ' ''
#     | str replace -a '"' ''
#     | split column =
#     | rename name value
#     | where name != "FNM_ARCH" and name != "PATH"
#     | reduce -f {} {|it, acc| $acc | upsert $it.name $it.value }
# )

# $env.PATH = ($env.PATH
#     | split row (char esep)
#     | prepend $"($env.FNM_MULTISHELL_PATH)/bin"
# )
## ------------------------------------
## add fnm for npm version controll

## set proxy in linux
## ------------------------------------
# $env.http_proxy = "http://127.0.0.1:20171"
# $env.https_proxy = "http://127.0.0.1:20171"
## ------------------------------------
## set proxy in linux


## mount samba in linux
## ------------------------------------
# sudo mount -t cifs //192.168.1.14/Art1 /mnt/samba/ -o username=liu
## ------------------------------------
## mount samba in linux
