
$HOME='pwd'
cd elsip
git git@github.com:xinmingyao/erlang-emacs-extend.git
cd erlang-emacs-extend 
./rebar compile
cd $HOME
cp -r elisp ~/
cp .emacs ~/
