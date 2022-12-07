Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		' grid1 initialization
		If (Not IsPostBack) Then
			Dim column1 As GridViewDataDateColumn = TryCast(grid1.Columns("BirthDate"), GridViewDataDateColumn)
			column1.PropertiesDateEdit.DisplayFormatString = cmbDate1.Text
		End If

		' grid2 initialization
		Dim column2 As GridViewDataDateColumn = TryCast(grid2.Columns("BirthDate"), GridViewDataDateColumn)
		column2.PropertiesDateEdit.DisplayFormatString = cmbDate2.Text
	End Sub

	Protected Sub cmbDate1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
		Dim column1 As GridViewDataDateColumn = TryCast(grid1.Columns("BirthDate"), GridViewDataDateColumn)
		column1.PropertiesDateEdit.DisplayFormatString = cmbDate1.Text

		' grid1 hierarchy re-creation
		grid1.DataBind()

		' grid2 hierarchy re-creation
		grid2.DataBind()
	End Sub

	Protected Sub grid2_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
		' grid2 hierarchy re-creation
		grid2.DataBind()
	End Sub
End Class
