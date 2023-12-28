Sub user-select()
    Dim sql As String
    Dim db As DAO.Database
    Set db = Application.CurrentDb

    sql = "SELECT * FROM user WHERE age > 1"

    db.Execute (sql)
    MsgBox "Success!" & _
        db.RecordsAffected
End Sub