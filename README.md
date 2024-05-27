# What's This?
- インストールされた直後の Ubuntu 24.04 Server を初期設定して，Docker を自動的にインストールすることができます．
- なお，Ubuntu Server のインストール時に下の画面で docker にチェックを入れていないことが前提です．


![install](install.png)

## スクリプトの実行
~~~
./run.sh
~~~

## 一旦ログアウト 
~~~
exit
~~~

## 再ログイン後
- ./run.sh を実行したユーザを docker グループに所属させているので，docker コマンドを実行する際に sudo は必要ありません．



