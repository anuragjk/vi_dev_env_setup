#!/bin/sh

WORKING_DIR=$(pwd)
TAG_FILE=tags.lst

catFile(){
	find $WORKING_DIR/$1 -name "*.c" >> $TAG_FILE
	echo -n "."
	find $WORKING_DIR/$1 -name "*.h" >> $TAG_FILE
	echo -n "."
	find $WORKING_DIR/$1 -name "*.cpp" >> $TAG_FILE
	echo -n "."
	find $WORKING_DIR/$1 -name "*.hpp" >> $TAG_FILE
	echo -n "."
}

echo -n "Creating tag file"
echo "" > $TAG_FILE
while getopts h:d: flag
do
	case $flag 
	in
	h) help;;
	d) catFile $OPTARG;;
	esac
done
echo ""

if [ -f cscope.out ]
then
	echo "Deleting cscope file"
	rm -f cscope.out
fi

if [ -f tags ]
then
	echo "Deleting tags file"
	rm -f tags
fi


if ! [ -f $TAG_FILE ]
then
	echo "Error: Tag file not created"
	exit
fi

echo "Tag file created successfully"

if [ -x $(command -v cscope) ]
then
	echo "Creating Cscope file..."
	cscope -b -i $TAG_FILE
	echo "Cscope file created successfully"
fi

if [ -x $(command -v ctags) ]
then
	echo "Creating Ctags file..."
	ctags -L $TAG_FILE
	echo "Ctags file created successfully"	
fi
