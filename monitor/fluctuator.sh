

# num_iterations=3
# while true; do
# 	top -n $num_iterations | head -5
# 	sleep 0.5
# done


while true; do
	echo $(python workspace/assist.py)
	sleep 1
done