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
* [tabular](https://github.com/godlygeek/tabular) Aligning text
* [less](https://github.com/groenewege/vim-less) syntax highlighting, indenting and autocompletion for the dynamic stylesheet language `LESS`.
* [snippets](https://github.com/honza/vim-snippets) snipMate & UltiSnip Snippets
* [nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs) NERDTree and tabs together in Vim, painlessly
* [bufexplorer](https://github.com/jlanzarotta/bufexplorer) BufExplorer Plugin for Vim
* [ctrlp](https://github.com/kien/ctrlp.vim) Fuzzy file, buffer, mru, tag, etc finder.
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

### fencview
this plugin auto detect CJK and Unicode file encodings. 
` :FencAutoDectect ` or ` :FencView `
and you can select the right encodings.

### tabular
#### Aligning assignments
Before:
```
one = 1
two = 2
three = 3
four = 4
```
Running `:Tab /=` produces
```
one   = 1
two   = 2
three = 3
four  = 4
```
#### Colon assignments
There are a couple of different ways that colon assignments could be aligned. If we start with an example that is not aligned:
```
var video = {
    metadata: {
        title: "Aligning assignments"
        h264Src: "/media/alignment.mov",
        oggSrc: "/media/alignment.ogv"
        posterSrc: "/media/alignment.png"
        duration: 320,
    }
}
````
Select the inner block by positioning your cursor inside it and running `vi}` (enable Visual mode, and select inner Brace). Then you could run `:Tab/:` which would produce this result:var 
```
video = {
    metadata: {
        title     : "Aligning assignments"
        h264Src   : "/media/alignment.mov",
        oggSrc    : "/media/alignment.ogv"
        posterSrc : "/media/alignment.png"
        duration  : 320,
    }
}
```
If you don’t like stacking the colons in a column, you could use the `\zs` atom to exclude the `:` character from the search match. Running `:Tab /:\zs` produces this result:
```
var video = {
    metadata: {
        title:      "Aligning assignments"
        h264Src:    "/media/alignment.mov",
        oggSrc:     "/media/alignment.ogv"
        posterSrc:  "/media/alignment.png"
        duration:   320,
    }
}
```
Be aware that if you work in a team, there may be a house style that you should follow.

#### Table markup
Here is a scenario outline for cucumber steps, including a pipe-delimited table of examples:
```
Scenario Outline: eating
  Given there are &lt;start&gt; cucumbers
  When I eat &lt;eat&gt; cucumbers
  Then I should have &lt;left&gt; cucumbers

  Examples:
    |start|eat|left|
    |12|5|7|
    |20|5|15|
```
With the cursor positioned anywhere in the table, running `:Tab/|` produces:
```
Scenario Outline: eating
  Given there are &lt;start&gt; cucumbers
  When I eat &lt;eat&gt; cucumbers
  Then I should have &lt;left&gt; cucumbers

  Examples:
    | start | eat | left |
    | 12    | 5   | 7    |
    | 20    | 5   | 15   |
```
see [tabular](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/) for more information.
See [doc/Tabular.txt](http://raw.github.com/godlygeek/tabular/master/doc/Tabular.txt) for detailed documentation.

### vimless

### nerdtree-tabs
`F7` nerdTreeTabs toggle

i### buf explorer
`F4` open BufExplorer
`<Leader>be` BufExplorer 
after open buf explorer windows, 
`j` or `k` to choose file, `r` re-order files, `d` or `D` close fiel.

### CtrlP.vim
* Run `F6` or `:CtrlP` or `:CtrlP [starting-directory]` to invoke CtrlP in find file mode.
* Run `:CtrlPBuffer` or `:CtrlPMRU` to invoke CtrlP in find buffer or find MRU file mode.
* Run `:CtrlPMixed` to search in Files, Buffers and MRU files at the same time.

Check `:help ctrlp-commands` and `:help ctrlp-extensions` for other commands.

#### Once CtrlP is open:
* Press `<F6>` to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
* Press `<c-f>` and `<c-b>` to cycle between modes.
* Press `<c-d>` to switch to filename only search instead of full path.
* Press `<c-r>` to switch to regexp mode.
* Use `<c-j>`, `<c-k>` or the arrow keys to navigate the result list.
* Use `<c-t>` or `<c-v>`, `<c-x>` to open the selected entry in a new tab or in a new split.
* Use `<c-n>`, `<c-p>` to select the next/previous string in the prompt's history.
* Use `<c-y>` to create a new file and its parent directories.
* Use `<c-z>` to mark/unmark multiple files and `<c-o>` to open them.

Run `:help ctrlp-mappings` or submit `?` in CtrlP for more mapping help.

* Submit two or more dots `..` to go up the directory tree by one or multiple levels.
* End the input string with a colon `:` followed by a command to execute it on the opening file(s):  
Use `:25` to jump to line 25.  
Use `:diffthis` when opening multiple files to run `:diffthis` on the first 4 files.


## Limitations

This image lacks [gdb](https://golang.org/doc/gdb) support. If anyone has managed to get it working on this image, please let me know (breakpoints are not working for me).

the follow link may solve this problem, pls let me know if it work!
[GDB problems inside docker](http://stackoverflow.com/questions/24586086/gdb-problems-inside-docker)
