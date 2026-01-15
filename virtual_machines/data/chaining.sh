

# check if the docker installed 
# docker -v &> /dev/null || {
#     echo "Docker not yet installed ❌" 
#     exit 1 
# }

# nginx -v


docker -v &> /dev/null 
if [[ $? -eq 0 ]]; then
    echo "Docker is already installed ✅ "
else 
    echo "Docker is not yet installed ❌" 
fi 
