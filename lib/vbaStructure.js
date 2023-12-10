'use strict';

module.exports = (functionName, sql) =>
  `Sub ${functionName}()
    Dim sql As String
    Dim db As DAO.Database
    Set db = Application.CurrentDb

    sql = "${sql}"

    db.Execute (sql)
    MsgBox "Success!" & _
        db.RecordsAffected
End Sub`;
