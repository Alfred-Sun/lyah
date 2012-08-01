## 如何撰寫文章

所有文件都放在`source/_posts/`底下，為純文字檔案。
可以用一些小語法來強調文字，標題等。
文章撰寫完成之後，可以用rake generate來產生html檔，
他預設會放在public底下，
generate完成之後可以用rake preview在local端開一個server，
可以用瀏覽器預覽撰寫情形。
預設port是5000，可以從Rakefile裡面改設定。

## Dependency

需要ruby-1.9.2，並安裝rake，其他tools資料夾底下有erb, fdoc等內附的lib

## Licence

CC BY-NC-SA 3.0

## Contribute

1. Fork it
1. Write your translations and commit
1. Send a pull-request

## Acknowledgement

Thanks MnO2, whom as the translator of the Learn You a Haskell For Great Good (Traditional Chinese version). The document generator written by myself is dirty and buggy, and even I can hardly make it runnable on Linux. Thank you for your work.
