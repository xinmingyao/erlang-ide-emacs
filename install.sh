base_dir= 'pwd'
echo $base_dir
cd elsip
git git@github.com:xinmingyao/erlang-emacs-extend.git
cd erlang-emacs-extend 
./rebar compile
cd $base_dir
cd common/distel
mkdir ebin
make install
cd $base_dir
cp -r elisp ~/
cp .emacs ~/
