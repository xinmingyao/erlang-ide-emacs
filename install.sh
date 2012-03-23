base_dir=`pwd`
echo $base_dir
p1=`./erl-path.sh 1`
p2=`./erl-path.sh 2`

p3="(setq erlang-root-dir \"$p1\")"
p4="(setq load-path (cons \"$p2/emacs\" load-path))"
p5="(setq exec-path (cons \"$p1/erlang/bin\" exec-path))"
$(eval "sed -i '1 i\ $p3' .emacs")
$(eval "sed -i '1 i\ $p4' .emacs")
$(eval "sed -i '1 i\ $p5' .emacs")
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
