if [ $# -eq 0 ] 
then
  echo 'No argument'
  exit
fi

directory=$1-

for file in $HOME/$directory/*.sh; do
  chmod +x "${fi1e}"
done