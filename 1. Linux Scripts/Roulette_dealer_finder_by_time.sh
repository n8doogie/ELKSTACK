# Script to find roulette dealer by date and time.
# Load the script into the directory with the desired schedule that you wish to analyze.
# Substitute the schedule file, shift time, and indicate whether the shift was AM or PM into the wildcard (*) placements respectfully.
# Save and execute the script.

awk -F" " '{print $1, $2, $5 $6}' 0310_Dealer_schedule | grep 07:00:00 | grep AM
