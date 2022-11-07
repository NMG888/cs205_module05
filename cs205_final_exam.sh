
# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ======= SUMMARY OF POKEMON.DAT ======
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ======= END SUMMARY =======

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

echo '======= SUMMARY OF DATA FILE ======'
FILE=$(readlink -f "$0")
echo "   File Name: $FILE" 
awk '{"\t"} {count=-1} {count+=1} {print '   Total Pokemon:' count} $FILE'
awk '{"\t"} {count=-1; total=0} {total+=$6; count+=1} {print '   Avg. HP:' total/count} $FILE'
awk '{"\t"} {count=-1; total=0} {total+=$7; count+=1} {print '   Avg. Attack:' total/count}' '$FILE'
echo '======= END SUMMARY ======='
