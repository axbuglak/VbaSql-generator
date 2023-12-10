Sub user-create()
    Dim sql As String
    Dim db As DAO.Database
    Set db = Application.CurrentDb

    sql = "CREATE TABLE user ( 
 (id BIGINT GENERATED ALWAYS AS IDENTITY), 
(name VARCHAR NOT NULL), 
(age INTEGER NOT NULL), 
)"

    db.Execute (sql)
    MsgBox "Success!" & _
        db.RecordsAffected
End Sub