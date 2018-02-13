import json

type
    Message* = object
        username*: string
        message*: string

proc parseMessage*(data: string): Message =
    let dataJson = parseJson(data)
    result.username = dataJson["username"].getStr()
    result.message = dataJson["message"].getStr()

proc createMessage*(username, message: string): string =
    result = $(%{
        "username": %username,
        "message": %message
    }) & "\c\l"

when isMainModule:
    # Test parsing of valid JSON
    block:
        let data = """{"username": "John", "message": "Hi!"}"""
        let parsed = parseMessage(data)
        doAssert parsed.username == "John"
        doAssert parsed.message == "Hi!"

    # Test parsing of invalid JSON
    block:
        try:
            discard parseMessage("foobar")
            doAssert false
        except JsonParsingError:
            doAssert true
        except:
            doAssert false
    
    # Test generating a JSON
    block:
        let expected = """{"username":"dom","message":"hello"}""" & "\c\l"
        doAssert createMessage("dom", "hello") == expected
