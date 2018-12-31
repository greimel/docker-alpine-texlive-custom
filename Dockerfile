FROM greimel/alpine-texlive-minimal

# Install dependencies for package manager
RUN apk update && apk upgrade
RUN apk --no-cache add perl wget python 

# Install basic collection using the tlmgr package manager
RUN tlmgr install collection-latex
RUN tlmgr install latexmk
# Install additional packages
RUN tlmgr install texliveonfly ## this package automatically installs required latex packages

