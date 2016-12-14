# git-gud

!!!! THIS REPO IS NOT READY !!!!

git gud for git

## Usage
```shell
git gud <cmd> [options]

```

## Installation

through curl
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/icosa-hk/git-gud/master/gitgud.sh)"
```

## Feature List
- [X] installation
- [ ] gud init
- [X] gud clone
- [X] gud pull
- [X] gud commit
- [X] gud undo
- [ ] gud profile
- [ ] gud backmerge

## Feature Details

### gud init

All-in-1 init, it will first init the git repo, and then:

1. Prompt for adding a `README.md`
2. Prompt for adding a `.gitignore`
3. Prompt for picking a git user profile
4. Prompt for adding the upstream URL
5. Upon finishing the above grunt work, prompt for making the first commit and push

### gud clone

Clone with submodules

### gud pull

Pull recursing and updating submodules

### gud commit

1. Add the files specified
2. Prompt for commit message
3. Prompt for permission to push
4. Push upon receiving permission

Alias include add, commit, and push, where if push is used, git-gud will push without prompting for permission


### gud undo [opt]

1. add: Undo an add
2. commit: Undo a local commit
3. changes: Undo all local changes to the lastest commit
4. push: Take the 2nd last commit and commit the changes needed for the last commit to revert to the 2nd last


### gud profile

1. without argument: read list of profiles and allow user to pick one
2. new : prompt to make a new profile
3. edit: show list of profiles to pick from for edit
4. delete : delete a profile

### gud config

Config Options:
1. warning: show warning prompts
2. verbose: print the commands performed

### gud backmerge

1. without argument: backmerge current branch into default branch
2. 1 argument: backmerge current branch to branch specified argument
3. 2 arguments: backmerge branch specified by 1st argument into the 2nd
