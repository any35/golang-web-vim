[中文版说明](README_CN.md)

# go-vim Docker image
This Docker image adds [Go](https://golang.org/) tools and the following vim plugins to the [official Go image](https://registry.hub.docker.com/_/golang/):

when use screen, don't forget to use 256 colors. By default, screen use an 8-color terminal emulator.
To enable 256 colors, you need to edit ~/.screenrc
```
attrcolor b ".I"    # allow bold colors - necessary for some reason
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'   # tell screen how to set colors. AB = background, AF=foreground
defbce on    # use current bg color for erased chars
```
for more information pls visit [use 256 colors in screen](https://wiki.archlinux.org/index.php/GNU_Screen)

* [delimitMate](https://github.com/Raimondi/delimitMate) provides automatic closing of quotes, parenthesis, brackets, etc.
* [neocomplete](https://github.com/Shougo/neocomplete.vim) auto completion.  It provides keyword completion system by maintaining a cache of keywords in the current buffer
* [gitgutter](https://github.com/airblade/vim-gitgutter) shows a git diff in the gutter (sign column) and stages/reverts hunks.
* [colors-solarized](https://github.com/altercation/vim-colors-solarized) color scheme--solarized
* [airline](https://github.com/bling/vim-airline)
* [scala](https://github.com/derekwyatt/vim-scala)
* [easymotion](https://github.com/easymotion/vim-easymotion)
* [json](https://github.com/elzr/vim-json)
* [go](https://github.com/fatih/vim-go)
* [snipmate](https://github.com/garbas/vim-snipmate)
* [Vundle](https://github.com/gmarik/Vundle.vim)
* [tabular](https://github.com/godlygeek/tabular)
* [less](https://github.com/groenewege/vim-less)
* [snippets](https://github.com/honza/vim-snippets)
* [nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [bufexplorer](https://github.com/jlanzarotta/bufexplorer)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [tagbar](https://github.com/majutsushi/tagbar)
* [addon-mw-utils](https://github.com/marcweber/vim-addon-mw-utils)
* [undotree](https://github.com/mbbill/undotree)
* [indent-object](https://github.com/michaeljsmith/vim-indent-object)
* [indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
* [html5](https://github.com/othree/html5.vim)
* [javascript](https://github.com/pangloss/vim-javascript)
* [markdown](https://github.com/plasticboy/vim-markdown)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [syntastic](https://github.com/scrooloose/syntastic)
* [expand-region](https://github.com/terryma/vim-expand-region)
* [multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
* [tlib](https://github.com/tomtom/tlib_vim)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [haml](https://github.com/tpope/vim-haml)
* [repeat](https://github.com/tpope/vim-repeat)
* [surround](https://github.com/tpope/vim-surround)
* [EasyGrep](https://github.com/vim-scripts/EasyGrep)
* [YankRing](https://github.com/vim-scripts/YankRing.vim)
* [mru](https://github.com/vim-scripts/mru.vim)
* [taglist](https://github.com/vim-scripts/taglist.vim)

## Usage

Run this image from within your go workspace. You can than edit your project using `vim`, and usual go commands: `go build`, `go run`, etc. 

```
cd your/go/workspace
docker run --rm -tiv `pwd`:/go any35/golang-web-vim
```

## Plugin Usage
TBD.

### neocomplete
![Vim completion with animation.](https://f.cloud.github.com/assets/214488/623496/94ed19a2-cf68-11e2-8d33-3aad8a39d7c1.gif)

### gitgutter
![show git diff status in file](http://ww1.sinaimg.cn/large/69d56e38gw1efni76kr62j20po0os78b.jpg)

### colors-solarized
Modify .vimrc
```
syntax enable
set background=dark
colorscheme solarized
```
or
```
syntax enable
set background=light
colorscheme solarized
```

## Limitations

This image lacks [gdb](https://golang.org/doc/gdb) support. If anyone has managed to get it working on this image, please let me know (breakpoints are not working for me).

