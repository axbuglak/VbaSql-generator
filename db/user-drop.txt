Sub user-drop()
    Dim sql As String
    Dim db As DAO.Database
    Set db = Application.CurrentDb

    sql = "DROP TABLE user"

    db.Execute (sql)
    MsgBox "Success!" & _
        db.RecordsAffected
End Sub