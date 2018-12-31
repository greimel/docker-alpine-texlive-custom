FROM greimel/alpine-texlive-minimal

# Install dependencies for package manager
RUN apk update && apk upgrade
RUN apk --no-cache add perl wget python 

# Install basic collection using the tlmgr package manager
RUN tlmgr install collection-latex

RUN tlmgr install latexmk
# Install additional packages
RUN tlmgr install texliveonfly ## this package automatically installs required latex packages

RUN apk add git
RUN git clone https://gitlab.com/greimel/header-files.git && \
    cd header-files/test && \
    texliveonfly --arguments='-pdf' --compiler=latexmk test.tex && \
    texliveonfly --arguments='-pdf' --compiler=latexmk test-beamer.tex && \
    cd ../.. && \
    rm -rf header-files
    
RUN apk del git