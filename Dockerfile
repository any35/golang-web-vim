# This dockerfile use the golang official image, to build a vim base 
# web dev env.
# VERSION 1 - EDITION 1

FROM golang:wheezy
MAINTAINER any35 hupeng.net@hotmail.com

ADD fs/ /

# install pagkages
RUN apt-get update                                                      && \
    apt-get install -y ncurses-dev libtolua-dev exuberant-ctags sudo    && \
    apt-get install -y build-essential openssl libssl-dev curl          && \
    apt-get install -y tmux                                             && \
    ln -s /usr/include/lua5.2/ /usr/include/lua                         && \
    ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/lib/liblua.so     && \
    curl -sL https://deb.nodesource.com/setup | sudo bash -             && \
    apt-get install -y nodejs                                           && \
    cd /tmp                                                             && \
    apt-get install ruby-full build-essential -y                        && \
    sudo gem install compass --pre                                      && \
# build and install vim
    git clone --depth 1  https://github.com/vim/vim.git                 && \
    cd vim/src                                                          && \
    ./configure --with-features=huge --enable-luainterp                    \
        --enable-gui=no --without-x --prefix=/usr                       && \
    make VIMRUNTIMEDIR=/usr/share/vim/vim74                             && \
    make install                                                        && \
# get go tools
    go get golang.org/x/tools/cmd/godoc                                 && \
    go get github.com/nsf/gocode                                        && \
    go get golang.org/x/tools/cmd/goimports                             && \
    go get github.com/rogpeppe/godef                                    && \
    go get golang.org/x/tools/cmd/oracle                                && \
    go get golang.org/x/tools/cmd/gorename                              && \
    go get github.com/golang/lint/golint                                && \
    go get github.com/kisielk/errcheck                                  && \
    go get github.com/jstemmer/gotags                                   && \
    mkdir -p /usr/src/go/bin/                                           && \
    mv /go/bin/* /usr/src/go/bin/                                       && \
    echo 'export PATH=/usr/src/go/bin/:$PATH' >> /etc/profile           && \
    echo 'export TERM="xterm-256color"' >> /etc/profile                 && \
# add dev user
    adduser dev --disabled-password --gecos ""                          && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers     && \
    chown -R dev:dev /home/dev /go                                      && \
# cleanup
    rm -rf /go/src/* /go/pkg                                            && \
    apt-get remove -y ncurses-dev                                       && \
    apt-get autoremove -y                                               && \
    apt-get clean && rm -rf /tmp/* /var/tmp/*
# rm -rf /var/lib/apt/lists/*

USER dev
ENV HOME /home/dev
WORKDIR /go

# install vim plugins
RUN mkdir -p ~/.vim/bundle                                              && \
    cd  ~/.vim/bundle                                                   && \
    git clone --depth 1 https://github.com/Raimondi/delimitMate.git            && \
    git clone --depth 1 https://github.com/Shougo/neocomplete.vim.git          && \
    git clone --depth 1 https://github.com/airblade/vim-gitgutter.git          && \
    git clone --depth 1 https://github.com/altercation/vim-colors-solarized.git && \
    git clone --depth 1 https://github.com/bling/vim-airline.git               && \
    git clone --depth 1 https://github.com/derekwyatt/vim-scala.git            && \
    git clone --depth 1 https://github.com/easymotion/vim-easymotion.git       && \
    git clone --depth 1 https://github.com/elzr/vim-json.git                   && \
    git clone --depth 1 https://github.com/fatih/vim-go.git                    && \
    git clone --depth 1 https://github.com/garbas/vim-snipmate.git             && \
    git clone --depth 1 https://github.com/gmarik/Vundle.vim.git               && \
    git clone --depth 1 https://github.com/godlygeek/tabular.git               && \
    git clone --depth 1 https://github.com/groenewege/vim-less.git             && \
    git clone --depth 1 https://github.com/honza/vim-snippets.git              && \
    git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs.git         && \
    git clone --depth 1 https://github.com/jlanzarotta/bufexplorer.git         && \
    git clone --depth 1 https://github.com/kien/ctrlp.vim.git                  && \
    git clone --depth 1 https://github.com/majutsushi/tagbar.git               && \
    git clone --depth 1 https://github.com/marcweber/vim-addon-mw-utils.git    && \
    git clone --depth 1 https://github.com/mbbill/undotree.git                 && \
    git clone --depth 1 https://github.com/michaeljsmith/vim-indent-object.git && \
    git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides.git && \
    git clone --depth 1 https://github.com/othree/html5.vim.git                && \
    git clone --depth 1 https://github.com/pangloss/vim-javascript.git         && \
    git clone --depth 1 https://github.com/plasticboy/vim-markdown.git         && \
    git clone --depth 1 https://github.com/scrooloose/nerdcommenter.git        && \
    git clone --depth 1 https://github.com/scrooloose/nerdtree.git             && \
    git clone --depth 1 https://github.com/scrooloose/syntastic.git            && \
    git clone --depth 1 https://github.com/terryma/vim-expand-region.git       && \
    git clone --depth 1 https://github.com/terryma/vim-multiple-cursors.git    && \
    git clone --depth 1 https://github.com/tomtom/tlib_vim.git                 && \
    git clone --depth 1 https://github.com/tpope/vim-fugitive.git              && \
    git clone --depth 1 https://github.com/tpope/vim-haml.git                  && \
    git clone --depth 1 https://github.com/tpope/vim-repeat.git                && \
    git clone --depth 1 https://github.com/tpope/vim-surround.git              && \
    git clone --depth 1 https://github.com/vim-scripts/EasyGrep.git            && \
    git clone --depth 1 https://github.com/vim-scripts/YankRing.vim.git        && \
    git clone --depth 1 https://github.com/vim-scripts/mru.vim.git             && \
    git clone --depth 1 https://github.com/vim-scripts/taglist.vim.git         && \
    vim +PluginInstall +qall                                                   && \
    ln /home/dev/.vimrc /root/.vimrc                                           && \
    ln /home/dev/.tmux.conf /root/.tmux.conf                                   && \
    ln -s /home/dev/.vim /root/.vim                                            && \
# cleanup
    rm -rf Vundle.vim/.git vim-go/.git tagbar/.git neocomplete.vim/.git          \
        nerdtree/.git vim-airline/.git vim-fugitive/.git                         \
        vim-nerdtree-tabs/.git undotree/.git vim-easymotion/.git                 \
        nerdcommenter/.git vim-javascript/.git tabular/.git delimitMate/.git     \
        vim-indent-guides/.git vim-less/.git html5.vim/.git vim-json/.git        \
        EasyGrep/.git bufexplorer/.git ctrlp.vim/.git                            \
        syntastic/.git tlib_vim/.git vim-addon-mw-utils/.git                     \
        vim-colors-solarized/.git taglist.vim/.git vim-expand-region/.git        \
        vim-gitgutter/.git vim-markdown/.git vim-indent-object/.git              \
        vim-multiple-cursors/.git vim-repeat/.git vim-surround/.git mru.vim/.git \
        YankRing.vim/.git vim-haml/.git vim-snipmate/.git vim-snippets/.git      \
        vim-scala/.git

# enable yeoman
RUN sudo npm install -g npm@latest                                   && \
    sudo npm install -g grunt grunt-cli bower                        && \
    sudo npm install -g yo gulp                                      && \
    sudo npm install -g generator-angular generator-webapp           
EXPOSE 9000
EXPOSE 35729

