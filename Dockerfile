FROM bpetit/rpmbuild:rhel8

# Copying all contents of rpmbuild repo inside container
COPY . .

# All remaining logic goes inside main.js , 
# where we have access to both tools of this container and 
# contents of git repo at /github/workspace
ENTRYPOINT ["node", "/usr/lib/main.js"]
