import json

type
    Message* = object
        username*: string
        message*: string

proc parseMessage*(data: string): Message =
    let dataJson = parseJson(data)
    result.username = dataJson["username"].getStr()
    result.message = dataJson["message"].getStr()

when isMainModule:
    # Test valid JSON
    block:
        let data = """{"username": "John", "message": "Hi!"}"""
        let parsed = parseMessage(data)
        doAssert parsed.username == "John"
        doAssert parsed.message == "Hi!"

    # Test invalid JSON
    block:
        let data = "foobar"
        try:
            discard parseMessage(data)
            doAssert false
        except JsonParsingError:
            doAssert true
        except:
            doAssert false
