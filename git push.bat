@echo on
git add .
git commit -m "push"
git remote add origin https://github.com/eiennidiana/eiennidiana.github.io.git
git fetch origin hexosource
git checkout -b hexosource
git push origin hexosource
pause