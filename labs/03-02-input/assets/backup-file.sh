# Этот скрипт создает бэкап данного файла, создавая копию как <filename>_bu
# Например 'my-pic.jpg' будет забэкаплен как 'my-pic.jpg_bu'
set -e

file_name="prepare-and-deploy"

cp $file_name ${file_name}_bu

echo "Done!"