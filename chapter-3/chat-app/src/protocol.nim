type
    Message* = object
        username*: string
        message*: string

proc parseMessage*(data: string): Message =
    discard
