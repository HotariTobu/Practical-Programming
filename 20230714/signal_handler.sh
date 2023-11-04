trap 'STATUS=$?; echo "Trapped!"; exit $STATUS' SIGINT

read -p "ok? (y/N): " yn
