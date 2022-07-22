#!/bin/bash
# Autor: Broly
# License: GNU General Public License v3.0
# https://www.gnu.org/licenses/gpl-3.0.txt
oneplus8t(){
clear
cat << "EOF"
#####################
#    AUTOBRINGUP    #
#####################
EOF
printf "\n\n"
printf "WARNING MAKE SURE TO ENTER THE CORRECT ROM NAME\n OR IT WILL RENAME SOME FILES WRONGLY!!!\n\n"
read -r -p "Please enter the name of the old rom: " oldrom
read -r -p "Now please enter the name of the new rom: " newrom
printf "\n\n"

if [[ -d "device/oneplus/kebab" ]]; then
	cd device/oneplus/kebab || exit
else
	printf "path to device doesn't exist!!\n"
	exit 1
fi

if [[ -f "$oldrom.dependencies" ]]; then
	mv "$oldrom".dependencies "$newrom".dependencies || :
else
	printf "There's no file .dependencies in /device/oneplus/kebab ignoring\n!!"
fi

if [[ -f "$oldrom"_kebab.mk ]]; then
	mv "$oldrom"_kebab.mk "$newrom"_kebab.mk
	sed -i 's/'"$oldrom"'/'"$newrom"'/g' ./*.*
	cd ../../../
else
	printf "file not found please make sure your device tree is correct!\n"
	exit 1
fi

if [[ -d "device/oneplus/sm8250-common" ]]; then
	cd device/oneplus/sm8250-common || exit
else
	printf "path to device doesn't exist"
	exit1
fi

if [[ -f "$oldrom.dependencies" ]]; then
	mv "$oldrom".dependencies "$newrom".dependencies || :
	sed -i 's/'"$oldrom"'/'"$newrom"'/g' ./*.*
	cd ../../../
else
	printf "There's no file .dependencies in device/oneplus/sm8250-common ignoring\n!!"
fi

printf "\n\n"
printf "your bring up is finished\n to start type\nsource build/envsetup.sh\n and lunch \n"
exit 1
}


motog6(){
clear
cat << "EOF"
#####################
#    AUTOBRINGUP    # 
#####################
EOF
printf "\n\n"
printf "WARNING MAKE SURE TO ENTER THE CORRECT ROM NAME\n OR IT WILL RENAME SOME FILES WRONGLY!!!\n\n"
read -r -p "Please enter the name of the old rom: " oldrom
read -r -p "Now please enter the name of the new rom: " newrom
printf "\n\n"

if [[ -d "device/motorola/ali" ]]; then
	cd device/motorola/ali || exit
else
	printf "path to device doesn't exist!!\n"
	exit 1
fi

if [[ -f "$oldrom.dependencies" ]]; then
	mv "$oldrom".dependencies "$newrom".dependencies || :
else 
	printf "There's no file .dependencies in /device/motorola/ali ignoring\n!!"
fi

if [[ -f "$oldrom"_ali.mk ]]; then
	mv "$oldrom"_ali.mk "$newrom"_ali.mk
	sed -i 's/'"$oldrom"'/'"$newrom"'/g' ./*.*
	cd ../../../
else
	printf "file not found please make sure your device tree is correct!\n"
	exit 1
fi

if [[ -d "device/motorola/msm8953-common" ]]; then 
	cd device/motorola/msm8953-common || exit
else 
	printf "path to device doesn't exist"
	exit1
fi

if [[ -f "$oldrom.dependencies" ]]; then
	mv "$oldrom".dependencies "$newrom".dependencies || :
	sed -i 's/'"$oldrom"'/'"$newrom"'/g' ./*.*
	cd ../../../
else
	printf "There's no file .dependencies in /device/motorola/msm8953-common ignoring\n!!"
fi

printf "\n\n"
printf "your bring up is finished\n to start type\nsource build/envsetup.sh\n and lunch \n"
exit 1
}

PS3="Select your device please: "

select lng in Oneplus8T MotoG6 Quit
do
    case $lng in
        "Oneplus8T")
            oneplus8t;;
        "MotoG6")
           motog6;;
        "Quit")
           echo "We're done"
           break;;
        *)
           echo "Ooops";;
    esac
done
