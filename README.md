# pathf

パスの変換とかいろいろするスクリプト言語。

使い方:

    pathf script [basepath]

basepath を省略した場合は $PWD が使用されます。

スクリプトの共通的な仕様:

ちょうど正規表現の `\s` と `\S` や `\w` と `\W` みたいに、  
`a` の対になる命令は必ず `A` です

たとえば `b` は `[b]asename` の略ですが、 `dirname` に相当するものは `d` ではなくて `B` です

例:

    # [b]asename
    pathf b # = basename $PWD

    # un[B]asename
    # dirname と違い、 `dirname /` は `.` を出力
    pathf B # = dirname $PWD
    pathf BB # = dirname $(dirname $PWD)
    pathf Bb # = basename $(dirname $PWD)

    # [c]ar path
    pathf c

    # [C]dr path
    patf C

    # [t]ilde
    pathf t # = もし $HOME が含まれていれば ~ に置換される
    pathf Bt # = dirname をした上で ~ に置換
    pathf tB # = $HOME を ~ に置換した上で dirname.

    # [d]elete prefix
    # $PWD から /path/to を削除
    # $PWD が /path/to から始まる場合、 /path/to を削除したパスを出力
    # $PWD が /path/to から始まらない場合、なにも出力しない
    echo /path/to | pathf d

