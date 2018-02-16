import threadpool

proc crash(): string =
    raise newException(Exception, "Crash")

let lineFlowVar = spawn crash()
sync()
