# Script for starting daily personal logs
# Very handy!  Must do as often as I can...  

MONTH=`date '+%b'`
YEAR=`date '+%Y'`
DAY=`date '+%d'`
WEEKDAY=`date '+%A'`
FULLDATE=`date '+%D'`
FILE_NAME=($WEEKDAY"_"$MONTH"_"$DAY".dlog")
FILE_PATH=($YEAR/$MONTH/$DAY/$FILE_NAME)

# Check to see if the log file exists already... if not...

if [ ! -f $FILE_PATH ]; then
	# make the directory/file as needed!
	if [ ! -d $YEAR/$MONTH/$DAY ]; then
		# make the day folder
		if [ ! -d $YEAR/$MONTH ]; then
            if [ ! -d $YEAR ]; then
			    # make the year folder
                mkdir $YEAR
            fi

            # make the month folder
			mkdir $YEAR/$MONTH
		fi
		
		# make the day folder
		mkdir $YEAR/$MONTH/$DAY
	fi
	
	# make the log file
	touch $FILE_PATH
    figlet $FULLDATE >> $FILE_PATH
fi

if [ -e $YEAR/$MONTH/$DAY/$FILE_NAME ]; then
	# open the log for editing!
    echo -e '\n' >> $FILE_PATH
    echo "-----------------------------------" >> $FILE_PATH
    date >> $FILE_PATH
    echo "-----------------------------------" >> $FILE_PATH
    echo -e '\n' >> $FILE_PATH
	vim + $YEAR/$MONTH/$DAY/$FILE_NAME 
fi

