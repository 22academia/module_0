
#!/bin/bash


# execution from module_* folders pattern
# ./program_folder/test.sh program_folder/executable

# execution inside program folder
# ./test.sh executable
wd=$(pwd)

executable=$1
if [ -z $executable ]; then
    echo "Error: No executable file recieved"
    echo "Expected: $0 <executable file>"
    exit 1
fi
if [ -n "$(echo "$executable" | grep ".c")" ]; then
    echo "Error: $executable is a C file : NOT an executable file"
    exit 1;
fi
if [ "$executable" == "sample" ]; then
    echo "Error: Given file is the sample"
    exit;
fi 


if [ -n "$(echo "$0" | grep -x "\./test\.sh")" ]; then

    if [ -z $(ls | grep -x $executable) ]; then
        echo "Error: $executable executable does not exist"
        exit 1
    fi

else
    string_before_forward_slash="${executable%%/*}"
    string_after_forward_slash="${executable#*/}"
    #echo "before $string_before_forward_slash"
    #echo "after $string_after_forward_slash"

    if [ -z $(ls $string_before_forward_slash | grep -x $string_after_forward_slash) ]; then
        echo "Error: $executable executable does not exist"
        exit 1
    fi
fi

output=$(./$executable)
expected=$(echo -e "\n\n\nw\n8\n\n")
echo "Testing: $executable"
sleep 0.3
if [ "$output" == "$expected" ]; then
    echo -e "\n                      *** Pass"
    $(echo "$executable" | cat > .info_executable)
else
    echo -e "\n                      --- Fail"
fi

if [ -n "$(echo "$0" | grep -x "\./test\.sh")" ]; then #write to info only if test is run in exercise
    $(echo "$executable" | cat > .info_executable)
fi
#info_exec should contain the lastest executable ran by test.sh, regardless of PASS or FAIL


sleep 0.2

