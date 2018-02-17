import database

import os, times

when isMainModule:
    removeFile("tweeter_test.db")
    var db = newDatabase("tweeter_test.db")
    db.setup()

    db.create(User(username: "andregmoeller"))
    db.create(User(username: "nim_lang"))

    db.post(Message(username: "nim_lang", time: getTime() - 4.seconds,
        msg: "Hello Nim in Action readers"))
    db.post(Message(username: "nim_lang", time: getTime(),
        msg: "99.9% off Nim in Action for everyone, for the next minute only!"))

    var andre: User
    doAssert db.findUser("andregmoeller", andre)
    var nim: User
    doAssert db.findUser("nim_lang", nim)
    db.follow(andre, nim)

    doAssert db.findUser("andregmoeller", andre)

    let messages = db.findMessages(andre.following)
    echo(messages)
    doAssert(messages[0].msg == "99.9% off Nim in Action for everyone, for the next minute only!")
    doAssert(messages[1].msg == "Hello Nim in Action readers")

    echo("All tests finished successfully!")
