FROM greimel/alpine-texlive-minimal

# Install dependencies for package manager
RUN apk update && apk upgrade
RUN apk --no-cache add perl wget 

# Install basic collection using the tlmgr package manager
RUN tlmgr install collection-latex
# Install additional packages
RUN tlmgr install texliveonfly ## this package automatically installs required latex packages

RUN apk del perl wget