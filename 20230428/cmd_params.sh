# while getopts "o:h" OPT; do
#   case ${OPT} in
#     o ) option=${OPTARG};;
#     h ) help=true;;
#     \? ) exit 1;;
#   esac
# done

# echo option $option
# echo help $help

echo $OPTIND
echo ${!OPTIND}

while getopts "s:-:" OPT; do
  case $OPT in
    s ) suffix="$OPTARG" ;;
    - ) echo ARG ${OPTARG}E
    case "${OPTARG}" in
          suffix=* ) suffix="${OPTARG#*=}" ;;
          suffix )   suffix="${OPTARG#\ }" ;;
          * )        echo "Invalid option: --$OPTARG" >&2
                     exit 1 ;;
        esac ;;
    \? ) exit 1 ;;
  esac
done

echo "suffix is $suffix"


# input_string=$1
# suffix=""

# while getopts "s:-:" opt; do
#   case $opt in
#     s )
#       suffix=$OPTARG
#       ;;
#     - )
#       case "${OPTARG}" in
#         suffix )
#           suffix="${!OPTIND}"
#           ((OPTIND++))
#           ;;
#         *)
#           echo "Invalid option: --$OPTARG" >&2
#           exit 1
#           ;;
#       esac
#       ;;
#     \? )
#       echo "Invalid option: -$OPTARG" >&2
#       exit 1
#       ;;
#     : )
#       echo "Option -$OPTARG requires an argument." >&2
#       exit 1
#       ;;
#   esac
# done

# echo "input string: $input_string"
# echo "suffix: $suffix"
