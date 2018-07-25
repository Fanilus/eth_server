# ++++++++++++ Setup eth server script by fan +++++++++++
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
# COMMANDS
arr=("sudo apt-get install software-properties-common")
arr+=('sudo add-apt-repository -y ppa:ethereum/ethereum')
arr+=('sudo apt-get update')
arr+=('sudo apt-get install ethereum')

for (( i = 0; i < ${#arr[@]} ; i++ )); do
    printf "\n***** Running: ${arr[$i]} *****\n"
    # Run each command in array 
    eval "${arr[$i]}" && echo "${green}[DONE]${reset} - ${arr[$i]}";

    ### using back-ticks works also
    #RESULT=`${arr[$i]}`
    ### Check if the command gave any output
    #if [ -n "$RESULT" ]; then
    #    echo "$RESULT"
    #fi
done
echo "${green}[DONE] - All ${#arr[@]} commands complete ${reset}"