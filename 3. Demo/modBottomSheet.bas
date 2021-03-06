﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=8.1
@EndOfDesignText@
'Static code module
Sub Process_Globals
	Public name As String = "bottomSheetCode"
	Public title As String = "Bottom Sheet"
	Private vm As BANanoVM
End Sub


Sub Code
	vm = pgIndex.vm
	'create a container to hold all contents
	Dim cont As VMContainer = vm.CreateContainer(name,Me)
	'hide this container
	cont.Hide
	'create 2 columns each spanning 12 columns
	cont.addrows(10).AddColumns2x6
	'
	vm.CreateButton("btnSheet", Me).SetLabel("Show Bottom Sheet").AddToContainer(cont, 1, 1)
	vm.CreateButton("btnInset", Me).SetLabel("Show Inset").AddToContainer(cont, 1, 2)
	
	Dim bs1 As VMBottomSheet = vm.CreateBottomSheet("bs1", Me).SetVModel("sheet").SetPersistent(True)
	'
	Dim s1 As VMSheet = vm.CreateSheet("s1", Me).SetTextCenter.SetHeight("200px")
	'
	s1.Container.AddRows(1).AddColumns12
	'
	Dim lbl As VMLabel = vm.CreateLabel("lblme").SetText("This is a botto sheet using persistent prop!").SetParagraph
	s1.Container.AddComponent(1, 1, lbl.ToString)
	'
	Dim btnClose As VMButton = vm.CreateButton("btnCloseSheet", Me).SetLabel("Close Sheet")
	s1.Container.AddComponent(1, 1, btnClose.ToString)
	'
	bs1.AddComponent(s1.ToString)
	'
	cont.AddComponent(1, 1, bs1.ToString)
	'
	cont.AddComponent(1, 1, BottomSheet2.ToString)
	'
	vm.AddContainer(cont)
End Sub

Sub BottomSheet2 As VMBottomSheet
	Dim bs As VMBottomSheet = vm.CreateBottomSheet("bs2", Me).SetVModel("bs2").SetInset(True)
	Dim s As VMSheet = vm.CreateSheet("s2", Me).SetTextCenter.SetHeight("200px")
	'
	s.Container.AddRows(1).AddColumns12
	'
	Dim lbl As VMLabel = vm.CreateLabel("lbl2").SetText("This is a botto sheet using inset prop!").SetParagraph
	s.Container.AddComponent(1, 1, lbl.ToString)
	'
	Dim btnClose As VMButton = vm.CreateButton("btnCloseSheet2", Me).SetLabel("Close Sheet")
	s.Container.AddComponent(1, 1, btnClose.ToString)
	'
	bs.AddComponent(s.ToString)
	Return bs
End Sub

Sub btnCloseSheet2_click(e As BANanoEvent)
	vm.SetData("bs2", False)
End Sub

Sub btnInset_click(e As BANanoEvent)
	vm.SetData("bs2", True)
End Sub

Sub btnSheet_click(e As BANanoEvent)
	vm.SetData("sheet", True)
End Sub

Sub btnCloseSheet_click(e As BANanoEvent)
	vm.SetData("sheet", False)
End Sub