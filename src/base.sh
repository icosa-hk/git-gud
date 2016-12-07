#!/bin/bash
# Use -gt 1 to consume two arguments per pass in the loop (e.g. each
# argument has a corresponding value to go with it).
# Use -gt 0 to consume one or more arguments per pass in the loop (e.g.
# some arguments don't have a corresponding value to go with it such
# as in the --default example).
# note: if this is set to -gt 0 the /etc/hosts part is not recognized ( may be a bug )

if [ $# -gt 0 ]; then
  case $1 in
    init )
      init.sh
      ;;
    clone )
      clone.sh
      ;;
    pull )
      pull.sh
      ;;
    push )
      push.sh
      ;;
    undo )
      shift
      undo.sh $@
      ;;
    profile )
      shift
      profile.sh $@
      ;;
    backmerge )
      backmerge.sh 
      ;;
    man )
      man.sh 
      ;;
    * )
      echo "git gud: $1 is not a valid command. See 'git gud man'."
      ;;
  esac
else
  cat $HOME/.git-gud/usage.txt
fi

# case $1 in
#     init
# while [[ $# -gt 1 ]]
# do
# key="$1"

# case $key in
#     -e|--extension )
#     EXTENSION="$2"
#     shift # past argument
#     ;;
#     -s|--searchpath )
#     SEARCHPATH="$2"
#     shift # past argument
#     ;;
#     -l|--lib )
#     LIBPATH="$2"
#     shift # past argument
#     ;;
#     --default )
#     DEFAULT=YES
#     ;;
#     *)
#             # unknown option
#     ;;
# esac
# shift # past argument or value
# done
# echo FILE EXTENSION  = "${EXTENSION}"
# echo SEARCH PATH     = "${SEARCHPATH}"
# echo LIBRARY PATH    = "${LIBPATH}"
# echo "Number files in SEARCH PATH with EXTENSION:" $(ls -1 "${SEARCHPATH}"/*."${EXTENSION}" | wc -l)
# if [[ -n $1 ]]; then
#     echo "Last line of file specified as non-opt/last argument:"
#     tail -1 $1
# fi