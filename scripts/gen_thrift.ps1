$THRIFT = "D:\my program\thrift-compiler\thrift.exe"
$SRC    = ".\thrift_src"
$OUT    = ".\thrift_gen"

if (Test-Path $OUT) {
    Remove-Item -Recurse -Force $OUT
}
New-Item -ItemType Directory -Force -Path $OUT | Out-Null

Get-ChildItem "$SRC\*.thrift" | ForEach-Object {
    & $THRIFT --gen py -out $OUT $_.FullName
}
