@echo off

git clone https://github.com/SEMOSS/semoss-ui.git
ren semoss-ui SemossWeb
cd SemossWeb
git checkout dev

exit
