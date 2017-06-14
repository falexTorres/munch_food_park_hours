new_name=$1
NewName=$2

git grep -l "sign_me_in" | xargs sed -i "" -e "s/sign_me_in/$new_name/g"
git grep -l "SignMeIn" | xargs sed -i "" -e "s/SignMeIn/$NewName/g"
mv ./lib/sign_me_in "./lib/$new_name"
mv ./lib/sign_me_in.ex "./lib/$new_name.ex"
