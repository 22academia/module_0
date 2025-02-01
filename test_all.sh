#!/bin/bash


#This need to handle behaviour where you check for
#multiple executable files in a module



#content="$(cat ./wesley/.info_executable)";
#echo "$content"
#echo -e "$(./wesley/test.sh wesley/wesley)"

#handle case where info_exec doesn't exist

#Right now the program only Reads the executable from .info; but info
#is only written too when ./test.sh is run. 
#I want the behaviour of test_all to search of executables, rather then needing .info

echo -n "."
sleep 0.7
echo -n "."
sleep 0.7
echo -n "."
sleep 0.7


echo -e "\n" #some top padding to look pretty
output=""
result=""
student_mark=0
number_of_modules=4

helloWorld_executable=$(cat "hello_world/.info_executable" 2>/dev/null) 
if [ -n "$helloWorld_executable" ]; then
    output="$(./hello_world/test.sh hello_world/$helloWorld_executable)"
    result=$(echo -e "$output" | grep "Pass")
    if [ -n "$result" ]; then
        student_mark=$((student_mark + 1))
    fi
    echo -e "$output"
else
    echo -e "INCOMPLETE: hello_world/$helloWorld_executable\n\n       --- No executable found"
fi


newline_executable=$(cat "newline/.info_executable" 2>/dev/null) # 2>/dev/null suppress error message. It redirects standard error to garbage 
if [ -n "$newline_executable" ]; then
    output="$(./newline/test.sh newline/$newline_executable)"
    result=$(echo -e "$output" | grep "Pass")
    if [ -n "$result" ]; then
        student_mark=$((student_mark + 1))
    fi
    echo -e "$output"
else
    echo -e "INCOMPLETE: newline/$newline_executable\n\n       --- No executable found"
fi


myName_executable=$(cat "my_name/.info_executable" 2>/dev/null) # 2>/dev/null suppress error message. It redirects standard error to garbage 
if [ -n "$myName_executable" ]; then
    output="$(./my_name/test.sh my_name/$myName_executable)"
    result=$(echo -e "$output" | grep "Pass")
    if [ -n "$result" ]; then
        student_mark=$((student_mark + 1))
    fi
    echo -e "$output"
else
    echo -e "INCOMPLETE: my_name/$myName_executable\n\n       --- No executable found"
fi


wesley_executable=$(cat "wesley/.info_executable" 2>/dev/null) # 2>/dev/null suppress error message. It redirects standard error to garbage 
if [ -n "$wesley_executable" ]; then
    output="$(./wesley/test.sh wesley/$wesley_executable)"
    result=$(echo -e "$output" | grep "Pass")
    if [ -n "$result" ]; then
        student_mark=$((student_mark + 1))
    fi
    echo -e "$output"
else
    echo -e "INCOMPLETE: wesley/$wesley_executable\n\n       --- No executable found"
fi



echo "Mark: $student_mark/ $number_of_modules"
if [ "$student_mark" -eq "$number_of_modules" ]; then

    echo -e "\nWooHoo! You've completed your first module.\nGreat job, your a programmer now!"

fi
