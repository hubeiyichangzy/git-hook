$workspaceDir = "C:\Workspace"

Function get-gitdir($root){
	get-repodir $root 'git'
}

Function get-repodir($root, $type){
	ls $root | %{ "$root\$_" } |? { test-path "$_\.$type"}
}

Function Do-WithRepoDir($action){
	process{
		write-host "--------------------------- $_ --------------------------" -f yellow
		push-location
		cd $_
		cp "c:\hooks\commit-msg" .git\hooks\commit-msg
		cp "c:\hooks\prepare-commit-msg" .git\hooks\prepare-commit-msg
		pop-location
	}
}

function st-all{
	get-gitDir $workspaceDir | do-withrepodir("gst")
}

get-gitDir $workspaceDir | do-withrepodir
