function dbInit() {
    var db = LocalStorage.openDatabaseSync("GameInformation_DB", "",
                                           "GameNumber", 1000)
    try {
        db.transaction(function (tx) {
            tx.executeSql(
                        'CREATE TABLE IF NOT EXISTS gamenumber_logorder1(id text  not null ,number text not null )')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    }
}

function dbGetHandle() {
    try {
        dbInit()

        var db = LocalStorage.openDatabaseSync("GameInformation_DB", "",
                                               "GameNumber", 1000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}
function dbReadAll() {

    var db = dbGetHandle()
    var readresult = 0
    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT id,number FROM gamenumber_logorder1')
        if (results.rows.length > 0) {
            var result = Number(results.rows.item(
                                    results.rows.length - 1).number)
        }

        readresult = result
    })
    return readresult
}

function dbUpdate(Pid, Pnumber) {
    var db = dbGetHandle()

    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'update gamenumber_logorder1 set number=? where id=?',
                    [Pnumber, Pid])
    })
}
function dbInsert(Pid, Pnumber) {
    var db = dbGetHandle()
    db.transaction(function (tx) {

        tx.executeSql('INSERT INTO gamenumber_logorder1 VALUES(?,?)',
                      [Pid, Pnumber])
    })
}
