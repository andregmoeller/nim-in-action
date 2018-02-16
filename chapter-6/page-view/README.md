# Page-View

This directory contains an application that parses Wikipedia’s page-view data and determines the most popular page in the English Wikipedia. The example uses data that can be downloaded at https://dumps.wikimedia .org/other/pagecounts-all-sites/2016/2016-01/pagecounts-20160101-050000.gz. I have not checked in the file!

## Compiling and Running

To compile and execute the application run (the extracted Wikipedia file must be in the same directory):
```Shell
nim c -d:release -r src/page_view.nim
```
