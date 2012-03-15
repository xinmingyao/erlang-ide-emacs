base_dir=`pwd`
echo $base_dir
cd elisp
rm -rf erlang-emacs-extend
git clone http://github.com/xinmingyao/erlang-emacs-extend.git
cd erlang-emacs-extend 
./rebar compile
./rebar ct
cd $base_dir

echo `pwd` 
cd elisp/distel/
mkdir ebin
make install
cd $base_dir
cp -r elisp ~/
cp .emacs ~/
