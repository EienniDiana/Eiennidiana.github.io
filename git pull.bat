@echo on
git init 
git remote add origin https://github.com/eiennidiana/eiennidiana.github.io.git
git fetch origin hexosource
git checkout -b hexosource
git pull origin hexosource
pause