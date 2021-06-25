#ROULETTE LOSS FINDER SCRIPT FOR 03/15
# Times of player losses on 03/15

# 05:00 AM
# 08:00 AM
# 02:00 PM

awk -F" " '{print $1, $2, $5 $6}' 0310_Dealer_schedule | grep '05:00:00 AM\|08:00:00 AM\|02:00:00 PM' >> Dealers_working_during_losses.txt
