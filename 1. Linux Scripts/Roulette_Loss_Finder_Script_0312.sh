# ROULETTE LOSS FINDER SCRIPT FOR 03/12

# TIMES OF LOSS
# 5:00  AM
# 8:00  AM
# 2:00  PM
# 8:00  PM
# 11:00 PM


awk -F" " '{print $1, $2, $5 $6}' 0310_Dealer_schedule | grep '05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM' >> Dealers_working_during_losses.txt
