# This dockerfile use the golang official image, to build a vim base 
# web dev env.
# VERSION 1 - EDITION 1

FROM golang:wheezy
MAINTAINER any35 hupeng.net@hotmail.com

# add dev user
RUN adduser dev --disabled-password --gecos ""                          && \
    apt-get update                                                      && \
    curl -sL https://deb.nodesource.com/setup | bash -                  && \
    apt-get install -y ncurses-dev libtolua-dev exuberant-ctags sudo       \
        apt-utils screen                                                && \
    apt-get install -y curl build-essential openssl libssl-dev tmux        \
        autotools-dev automake                                             \
        libevent-dev cmake ruby-full build-essential                    && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers     && \
    mkdir -p /home/dev /go                                              && \
    chown -R dev:dev /home/dev /go                                      && \
    apt-get install -y nodejs                                           && \
    echo 'PATH=/usr/local/go/bin/:$PATH' >> /etc/environment            && \
    echo 'TERM="xterm-256color"' >> /etc/environment                    && \
    echo 'PATH=/usr/local/go/bin/:$PATH' >> /root/.bashrc               && \
    echo 'TERM="xterm-256color"' >> /root/.bashrc                       && \
    echo 'TERM="xterm-256color"' >> ~/.bashrc                           && \
    sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g'            \
        ~/.bashrc                                                       && \
    echo 'PS1=`echo $PS1|sed "s/\\\\\\w/\\\\\\W/g"`' >> ~/.bashrc       && \
    ln -s /usr/include/lua5.2/ /usr/include/lua                         && \
    ln -s /usr/lib/x86_64-linux-gnu/liblua5.2.so /usr/lib/liblua.so     && \
    gem install compass --pre                                           && \
# get go tools
    export PATH=/usr/local/go/bin:$PATH                                 && \
    go get golang.org/x/tools/cmd/godoc                                 && \
    go get github.com/nsf/gocode                                        && \
    go get golang.org/x/tools/cmd/goimports                             && \
    go get github.com/rogpeppe/godef                                    && \
    go get golang.org/x/tools/cmd/oracle                                && \
    go get golang.org/x/tools/cmd/gorename                              && \
    go get github.com/golang/lint/golint                                && \
    go get github.com/kisielk/errcheck                                  && \
    go get github.com/jstemmer/gotags                                   && \
    sudo mkdir -p /usr/local/go/bin/                                    && \
    sudo mv /go/bin/* /usr/local/go/bin/ 

ADD fs/ /
USER dev
ENV HOME /home/dev
ENV TERM xterm-256color
WORKDIR /go
EXPOSE 9000
EXPOSE 35729

# install pagkages
RUN cd /tmp                                                                    && \
# build and install tmate
    git clone --depth 1 https://github.com/nviennot/tmate                      && \
    cd tmate && ./autogen.sh && ./configure                                    && \
    make && sudo make install && cd ../ && sudo rm -rf tmate/                  && \
# build and install vim
    git clone --depth 1  https://github.com/vim/vim.git                        && \
    cd vim/src                                                                 && \
    ./configure --with-features=huge --enable-luainterp                           \
        --enable-gui=no --without-x --prefix=/usr                              && \
    make VIMRUNTIMEDIR=/usr/share/vim/vim74                                    && \
    sudo make install && cd /tmp && rm -rf vim/                                && \
# cleanup
    sudo rm -rf /go/src/* /go/pkg                                              && \
# cleanup
    sudo rm -rf /go/src/* /go/pkg                                              && \
    sudo apt-get remove -y ncurses-dev                                         && \
    sudo apt-get autoremove -y                                                 && \
    sudo apt-get clean && rm -rf /tmp/* /var/tmp/*                             && \
# rm -rf /var/lib/apt/lists/*
# install vim plugins
    sudo mkdir -p ~/.vim/bundle && sudo  chown -R dev:dev ~/                   && \
    cd  ~/.vim/bundle                                                          && \
    git clone --depth 1 https://github.com/Raimondi/delimitMate.git && rm -rf delimitMate/.git                      && \
    git clone --depth 1 https://github.com/Shougo/neocomplete.vim.git && rm -rf neocomplete.vim/.git                && \
    git clone --depth 1 https://github.com/airblade/vim-gitgutter.git && rm -rf vim-gitgutter/.git                  && \
    git clone --depth 1 https://github.com/altercation/vim-colors-solarized.git && rm -rf vim-colors-solarized/.git && \
    git clone --depth 1 https://github.com/bling/vim-airline.git && rm -rf vim-airline/.git                         && \
    git clone --depth 1 https://github.com/derekwyatt/vim-scala.git && rm -rf vim-scala/.git                        && \
    git clone --depth 1 https://github.com/easymotion/vim-easymotion.git && rm -rf vim-easymotion/.git              && \
    git clone --depth 1 https://github.com/elzr/vim-json.git && rm -rf vim-json/.git                                && \
    git clone --depth 1 https://github.com/fatih/vim-go.git && rm -rf vim-go/.git                                   && \
    git clone --depth 1 https://github.com/garbas/vim-snipmate.git && rm -rf vim-snipmate/.git                      && \
    git clone --depth 1 https://github.com/gmarik/Vundle.vim.git && rm -rf Vundle.vim/.git                          && \
    git clone --depth 1 https://github.com/godlygeek/tabular.git && rm -rf tabular/.git                             && \
    git clone --depth 1 https://github.com/groenewege/vim-less.git && rm -rf vim-less/.git                          && \
    git clone --depth 1 https://github.com/honza/vim-snippets.git && rm -rf vim-snippets/.git                       && \
    git clone --depth 1 https://github.com/jistr/vim-nerdtree-tabs.git && rm -rf vim-nerdtree-tabs/.git             && \
    git clone --depth 1 https://github.com/jlanzarotta/bufexplorer.git && rm -rf bufexplorer/.git                   && \
    git clone --depth 1 https://github.com/kien/ctrlp.vim.git && rm -rf ctrlp.vim/.git                              && \
    git clone --depth 1 https://github.com/majutsushi/tagbar.git && rm -rf tagbar/.git                              && \
    git clone --depth 1 https://github.com/marcweber/vim-addon-mw-utils.git && rm -rf vim-addon-mw-utils/.git       && \
    git clone --depth 1 https://github.com/mbbill/undotree.git && rm -rf undotree/.git                              && \
    git clone --depth 1 https://github.com/michaeljsmith/vim-indent-object.git && rm -rf vim-indent-object/.git     && \
    git clone --depth 1 https://github.com/nathanaelkane/vim-indent-guides.git && rm -rf vim-indent-guides/.git     && \
    git clone --depth 1 https://github.com/othree/html5.vim.git && rm -rf html5.vim/.git                            && \
    git clone --depth 1 https://github.com/pangloss/vim-javascript.git && rm -rf vim-javascript/.git                && \
    git clone --depth 1 https://github.com/plasticboy/vim-markdown.git && rm -rf vim-markdown/.git                  && \
    git clone --depth 1 https://github.com/scrooloose/nerdcommenter.git && rm -rf nerdcommenter/.git                && \
    git clone --depth 1 https://github.com/terryma/vim-expand-region.git && rm -rf vim-expand-region/.git           && \
    git clone --depth 1 https://github.com/terryma/vim-multiple-cursors.git && rm -rf vim-multiple-cursors/.git     && \
    git clone --depth 1 https://github.com/tomtom/tlib_vim.git && rm -rf tlib_vim/.git                              && \
    git clone --depth 1 https://github.com/tpope/vim-fugitive.git && rm -rf vim-fugitive/.git                       && \
    git clone --depth 1 https://github.com/tpope/vim-haml.git && rm -rf vim-haml/.git                               && \
    git clone --depth 1 https://github.com/tpope/vim-repeat.git && rm -rf vim-repeat/.git                           && \
    git clone --depth 1 https://github.com/tpope/vim-surround.git && rm -rf vim-surround/.git                       && \
    git clone --depth 1 https://github.com/vim-scripts/EasyGrep.git && rm -rf EasyGrep/.git                         && \
    git clone --depth 1 https://github.com/vim-scripts/YankRing.vim.git && rm -rf YankRing/.git                     && \
    git clone --depth 1 https://github.com/vim-scripts/mru.vim.git && rm -rf mru.vim/.git                           && \
    git clone --depth 1 https://github.com/vim-scripts/taglist.vim.git && rm -rf taglist.vim/.git                   
RUN vim +PluginInstall +qall                                                   && \
    sudo ln /home/dev/.vimrc /root/.vimrc                                      && \
    sudo ln /home/dev/.tmux.conf /root/.tmux.conf                              && \
    sudo ln /home/dev/tmux-panes /root/tmux-panes                              && \
    sudo ln -s /home/dev/.vim /root/.vim                                       && \
# enable yeoman
    sudo npm install -g npm@latest                                             && \
    sudo npm upgrade -g npm                                                    && \
    sudo npm install -g grunt grunt-cli bower                                  && \
    sudo npm install -g yo gulp                                                && \
    sudo npm install -g generator-angular generator-webapp                     && \           
    sudo npm install -g generator-karma
