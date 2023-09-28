#!/bin/sh
filesdir=$1
searchstr=$2
if [ -z "${filesdir}" ] || [ -z "${searchstr}" ]; then
    echo "Invalid number of arguments. Format [filesdir] [searchstr]"
    exit 1 #case of failure

fi
if ! [ -d "${filesdir}" ]; then
    echo "${filesdir} is not a directory on the system. Enter valid location"
    exit 1
fi
 

# Find all files in the current directory and subdirectories
files=$(find ${filesdir} -type f)

# Count the number of files
number_of_files=$(echo "$files" | wc -l)


#Find the searchstr in each of the files and update count
number_of_matches=$(grep -r ${searchstr} ${files} | wc -l)

# Print the number of files
echo "The number of files are ${number_of_files} and the number of matching lines are ${number_of_matches}"
