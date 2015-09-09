[中文版说明](README_CN.md)

# go-vim Docker image
This Docker image adds [Go](https://golang.org/) tools and the following vim plugins to the [official Go image](https://registry.hub.docker.com/_/golang/):

when use screen, don't forget to use 256 colors. By default, screen use an 8-color terminal emulator.
To enable 256 colors, you need to edit ~/.screenrc
```
attrcolor b ".I"   
termcapinfo xterm 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'   
defbce on    
```
for more information pls visit [use 256 colors in screen](https://wiki.archlinux.org/index.php/GNU_Screen)

* [delimitMate](https://github.com/Raimondi/delimitMate) provides automatic closing of quotes, parenthesis, brackets, etc.
* [neocomplete](https://github.com/Shougo/neocomplete.vim) auto completion.  It provides keyword completion system by maintaining a cache of keywords in the current buffer
* [gitgutter](https://github.com/airblade/vim-gitgutter) shows a git diff in the gutter (sign column) and stages/reverts hunks.
* [colors-solarized](https://github.com/altercation/vim-colors-solarized) color scheme--solarized
* [airline](https://github.com/bling/vim-airline) lean & mean status/tabline for vim that's light as air
* [scala](https://github.com/derekwyatt/vim-scala)  a "bundle" for Vim that builds off of the initial Scala plugin
* [easymotion](https://github.com/easymotion/vim-easymotion) EasyMotion provides a much simpler way to use some motions in vim.
* [json](https://github.com/elzr/vim-json) A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
* [go](https://github.com/fatih/vim-go) Go development plugin for Vim
* [snipmate](https://github.com/garbas/vim-snipmate) provide support for textual snippets, similar to TextMate or other Vim plugins like UltiSnips.
* [Vundle](https://github.com/gmarik/Vundle.vim) plugin manager for vim.
* [tabular](https://github.com/godlygeek/tabular)
* [less](https://github.com/groenewege/vim-less)
* [snippets](https://github.com/honza/vim-snippets) snipMate & UltiSnip Snippets
* [nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)
* [bufexplorer](https://github.com/jlanzarotta/bufexplorer)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [tagbar](https://github.com/majutsushi/tagbar)
* [addon-mw-utils](https://github.com/marcweber/vim-addon-mw-utils) interpret a file by function and cache file automatically(required by snipmate)
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
* [tlib](https://github.com/tomtom/tlib_vim) (required by snipmatge)
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
 add `--privileged` flag debugger is needed
 
## Plugin Details
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

### easymotion
=====

	<cursor>Lorem ipsum dolor sit amet.

Type `<Leader><Leader>w`(`<Plug>(easymotion-w)`) to trigger the word motion `w`.
When the motion is triggered, the text is updated (no braces are actually added,
the text is highlighted in red by default):

	<cursor>Lorem {a}psum {b}olor {c}it {d}met.

Press `c` to jump to the beginning of the word "sit":

	Lorem ipsum dolor <cursor>sit amet.

Similarly, if you're looking for an "o", you can use the `f` motion.
Type `<Leader><Leader>fo`, and all "o" characters are highlighted:

	<cursor>L{a}rem ipsum d{b}l{c}r sit amet.

Press `b` to jump to the second "o":

	Lorem ipsum d<cursor>olor sit amet.

Jeffrey Way of Nettuts+ has also [written
a tutorial](http://net.tutsplus.com/tutorials/other/vim-essential-plugin-easymotion/)
about EasyMotion.

### json

### snipMate
For example, in C, typing `for<tab>` could be expanded to

    for (i = 0; i < count; i++) {
        /* code */
    }

with successive presses of tab jumping around the snippet.

in go, type `fun<tab>` could be expanded to 
```
    func funcName() error {
    
    }
```

for more snippets in golang pls see [go.snippets](https://github.com/honza/vim-snippets/blob/master/snippets/go.snippets)
and [more snippets](https://github.com/honza/vim-snippets/tree/master/snippets)


## Limitations

This image lacks [gdb](https://golang.org/doc/gdb) support. If anyone has managed to get it working on this image, please let me know (breakpoints are not working for me).

the follow link may solve this problem, pls let me know if it work!
[GDB problems inside docker](http://stackoverflow.com/questions/24586086/gdb-problems-inside-docker)
