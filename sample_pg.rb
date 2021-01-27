# pgライブラリを使用する
require 'pg'
# PG::connect(dbname: "goya")により、rubyからgoyaDBに接続し
# 接続したという情報をconnectionという名前の変数に格納する
connection = PG::connect(dbname: "goya")
connection.internal_encoding = "UTF-8"
begin
  # connection変数を使いPostgreSQLを操作する
  # .execで、goyaDBに"select weight, give_for from crops;"
  # のSQLの命令文を直接実行し、その結果をresult変数に格納する
  result = connection.exec("select * from crops WHERE give_for != '自家消費';")
  # 取り出した各行を処理する
  result.each do |record_one|
      # 各行を取り出し、putsでターミナル上に出力する
      puts "ゴーヤの大きさ：#{record["weight"]}　売った相手：#{record["give_for"]}"


  result_false = connection.exec("select * from crops WHERE quality = false;")
  result_false.each do |record_two|
     puts "ゴーヤの品質：#{record_false["quality = false"]}"

  end
ensure
  # 最後に.finishでデータベースへのコネクションを切断する
  connection.finish
end
