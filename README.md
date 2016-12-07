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

- [ ] gud init
- [X] gud clone
- [X] gud pull
- [ ] gud commit
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
3. Push

### gud undo [opt]

1. add: Undo an add
2. commit: Undo a commit
3. push: Undo a push


### gud profile


### gud backmerge