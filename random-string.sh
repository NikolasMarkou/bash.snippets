## Generate random string on stdout
## Arguments
##	length - length of output string
##	upper - use uppercase characters (true|false) default is true
##	lower - use lowercase characters (true|false) default is true
##	numeric - use numeric characters (true|false) default is true
function random-string
{
	## Default Arguemnts
	local length=32
	local upper=true
	local lower=true
	local numeric=true
	## Primitive argument parsing
	local args=("$@")

	[ ! -z "${args[0]}" ] && length=${args[0]}
	[ ! -z "${args[1]}" ] && upper=${args[1]}
	[ ! -z "${args[2]}" ] && lower=${args[2]}
	[ ! -z "${args[3]}" ] && numeric=${args[3]}

	## Internals
	local trPattern=""
	[ ${lower} = true ] && trPattern=${trPattern}"a-z"
	[ ${upper} = true ] && trPattern=${trPattern}"A-Z"
	[ ${numeric} = true ] && trPattern=${trPattern}"0-9"

	trPattern=${trPattern}

	## Produce the random string
	cat /dev/urandom | tr -dc ${trPattern} | fold -w ${length} | head -n 1
	
	return $?
}
