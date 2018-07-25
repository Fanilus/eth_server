red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`
function doCommands(){
	arr=("$@")	
	for (( i = 0; i < ${#arr[@]} ; i++ )); do
		printf "\n******************************************\n"
		printf "${yellow}Running: ${arr[$i]}${reset}"
		printf "\n******************************************\n\n"
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
}
