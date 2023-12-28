Sub user-insert()
    Dim sql As String
    Dim db As DAO.Database
    Set db = Application.CurrentDb

    sql = "INSERT INTO user (name, age) VALUES 
 (alex, 16) 
(sasha, 16) 
"

    db.Execute (sql)
    MsgBox "Success!" & _
        db.RecordsAffected
End Sub