if [[ $1 -eq 1 ]]; then
    echo -e "\033[?25h"
else
    echo -e "\033[?25l"
fi
