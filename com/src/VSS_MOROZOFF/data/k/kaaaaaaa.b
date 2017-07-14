HA$PBExportHeader$com_pu_dw_s.sru
$PBExportComments$$$HEX3$$997d7f624351$$ENDHEX$$DataWindow$$HEX5$$08ff71511a9028750130$$ENDHEX$$LEG(leg_pu_dw)$$HEX1$$6830$$ENDHEX$$MES(mes_pu_dw)$$HEX4$$6e30997d7f624351$$ENDHEX$$DataWindow$$HEX5$$6e30435109ff0d000a00$$ENDHEX$$forward
global type com_pu_dw_s from datawindow
end type
end forward

global type com_pu_dw_s from datawindow
integer width = 488
integer height = 402
integer taborder = 1
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event key pbm_dwnkey
event insertaction ( )
event type boolean insertwhere ( )
event keyopen ( )
event zero_pack ( long row,  dwobject dwo,  string data )
end type
global com_pu_dw_s com_pu_dw_s

type variables
Window		Parent_Window	//$$HEX1$$aa89$$ENDHEX$$Window
Boolean		Auto_SelectRow	//SelectRow
Boolean		Auto_EnterToTab	//Enter$$HEX1$$6730$$ENDHEX$$Tab
Boolean		Auto_InsertRow	//InsertRow
Boolean		auto_zero_pack	//$$HEX10$$7eff9eff9bff708a2452ad650d000a000d000a00$$ENDHEX$$end variables

forward prototypes
public function long get_column_len (dwobject a_dwo)
public function boolean wf_mod_set (long al_row, string as_column_name, string as_data, integer ai_mode)
public function boolean wf_mod_get (long al_row, string as_column_name, ref string as_data, integer ai_mode)
public function boolean wf_button_clicked (string as_column_name)
end prototypes

event key;/*************************************************************************************************
$$HEX9$$72ff9dff7dff80ff9dff7dff095970652000$$ENDHEX$$Auto_EnterToTab$$HEX1$$4c30$$ENDHEX$$TRUE$$HEX3$$6e3068304d30$$ENDHEX$$Enter$$HEX23$$77ff70ff67308cff6bff70ff76ff7dfffb79d552ef53fd800d000a0072ff9dff7dff80ff9dff7dff095970652000$$ENDHEX$$Auto_InsertRow$$HEX1$$4c30$$ENDHEX$$TRUE$$HEX1$$6730$$ENDHEX$$Last_Column$$HEX3$$6e3068304d30$$ENDHEX$$InsertAction$$HEX20$$a430d930f330c8309230778dd55259308b300d000a0072ff9dff7dff80ff9dff7dff095970652000$$ENDHEX$$Parent_Window$$HEX10$$6b3073ff68ff9dff84ff9eff73ff0d540d000a00$$ENDHEX$$***********************************************/
Choose Case Key
	Case KeyEnter!
		If auto_entertotab Then
			If auto_insertrow Then
				If This.Trigger Event InsertWhere() Then	//$$HEX24$$4c88fd8fa0526167f64ea430d930f330c83008ff997d7f6248516730188af08f09ff0d000a0009000900090009000900$$ENDHEX$$This.Trigger Event InsertAction()	//$$HEX24$$4c88fd8fa052e6510674a430d930f330c83008ff997d7f6248516730188af08f09ff0d000a0009000900090009000900$$ENDHEX$$Send(Handle(This), 256, 9, Long(0, 0))
				Else
					Send(Handle(This), 256, 9, Long(0, 0))
				End If
			Else
				Send(Handle(This), 256, 9, Long(0, 0))
			End If
		End If
		Return 1
		
	Case KeyTab!	//Tab
		If auto_insertrow Then
			If This.Trigger Event InsertWhere() Then	//$$HEX23$$4c88fd8fa0526167f64ea430d930f330c83008ff997d7f6248516730188af08f09ff0d000a000900090009000900$$ENDHEX$$This.Trigger Event InsertAction()	//$$HEX22$$4c88fd8fa052e6510674a430d930f330c83008ff997d7f6248516730188af08f09ff0d000a00090009000900$$ENDHEX$$End If
		End If
		Return 0
		
	Case gstr_kaisya.key[9]
		This.Trigger Event keyopen()
		Return 0
	Case	gstr_kaisya.key[1],	gstr_kaisya.key[2],	gstr_kaisya.key[3],	gstr_kaisya.key[4],	gstr_kaisya.key[5],	&
			gstr_kaisya.key[6],	gstr_kaisya.key[7],	gstr_kaisya.key[8],	gstr_kaisya.key[10], gstr_kaisya.key[11],	&
			gstr_kaisya.key[12],	gstr_kaisya.key[13],	gstr_kaisya.key[14],	gstr_kaisya.key[15]
//		If This.GetRow() > 0 Then
			parent_window.Trigger Event Key(key, keyflags)
//		End If
		Return 0
End Choose

end event

event insertaction();//$$HEX5$$4c88fd8fa0520d000a00$$ENDHEX$$this.InsertRow(0)
end event

event type boolean insertwhere();//.insertwhere
//$$HEX31$$0067427d4c886730013065519b52ef53fd80ab30e930e0306e30693053304b304c3065519b5255308c305f3068304d30b0658f894c88fd8fa0520d000a00$$ENDHEX$$Long				ll_row, ll_max
DWItemStatus 	ldwis_sta

This.AcceptText()

ll_row = This.getrow()		//$$HEX5$$fe734c884c880d000a00$$ENDHEX$$ll_max = This.rowcount()	//$$HEX5$$0067427d4c880d000a00$$ENDHEX$$ldwis_sta = This.getitemstatus(ll_row, 0, Primary!)

If ll_row = ll_max AND (ldwis_sta = DataModified! OR ldwis_sta = NewModified!) Then
	Return true
Else
	Return false
End If
end event

event zero_pack(long row, dwobject dwo, string data);/*---------------------------------------------------------------------------
$$HEX4$$0d540030f0790900$$ENDHEX$$ZERO_PACK

$$HEX21$$ac8a00300e660900e65d7eff9eff9bff708a92304c88463095ff70ff7bff9eff72ff8dff9eff9dff84ff$$ENDHEX$$(ItemChanged$$HEX12$$72ff8dff9eff9dff84ff88308a30778dd55255308c308b30$$ENDHEX$$)
			$$HEX3$$464f57300130$$ENDHEX$$ItemChanged$$HEX25$$778dd5528c5f6b300130535f72ff8dff9eff9dff84ff4c30778dd55255308c308b300d000a000d000a00155f003070650900$$ENDHEX$$Long		row	:$$HEX13$$0959f46655308c305f304c886a75f7530d000a00090009000900$$ENDHEX$$dwobject	dwo	:$$HEX15$$0959f46655308c305f3076ff97ff91ffc56031580d000a00090009000900$$ENDHEX$$String	data	:$$HEX27$$0959f46655308c305f30b0655730443024500d000a000d000a003b620030245009006a3057300d000a000d000a005c4f1062e5650900$$ENDHEX$$2000.11.16	Jupiter	T.Ohno

$$HEX4$$f466b065e5650900$$ENDHEX$$2005.05.20				tada		PB$$HEX16$$d0639b4f6e30a295706592307f4f287559308b3088304630ee4f636b0d000a00$$ENDHEX$$---------------------------------------------------------------------------*/

Long		ll_column_len
String	ls_buf

If auto_zero_pack Then
	If Upper(Left(dwo.coltype, 4)) <> "CHAR" Then
		//$$HEX17$$7eff9eff9bff708a92304c884a30463068305730663044308b3076ff97ff91ff4c30$$ENDHEX$$CHAR$$HEX17$$8b5767306a3044306e306730e65106749230375f3652427d864e0d000a0009000900$$ENDHEX$$This.SetRedraw(True)
		Return
	End if

//	//$$HEX12$$76ff97ff91ff6e308765575b70656e30d653975f0d000a00$$ENDHEX$$//	ll_column_len	= get_column_len(dwo)
//	
//	//$$HEX11$$e65d92307eff9eff9bff708a6b3059308b300d000a00$$ENDHEX$$//	ls_buf	= pf_zero_pack(data, ll_column_len)
//	This.SetItem(row, dwo.name, ls_buf)

	This.SetItem(row, dwo.name, data)	// 2005.08.31 UPD $$HEX24$$bc30ed30d130c330af30e6510674fe5bdc5f6e305f308130c730fc30bf306e30216e5730b96592300959f4660d000a00$$ENDHEX$$End if

This.SetRedraw(True)
end event

public function long get_column_len (dwobject a_dwo);//-----------------------------------------------------------------------
//$$HEX4$$0d540030f0790900$$ENDHEX$$get_column_len
//
//$$HEX24$$ac8a00300e66090076ff97ff91ffc560315888308a3076ff97ff91ff6e30416870659230d653975f59308b300d000a00$$ENDHEX$$//
//$$HEX4$$155f003070650900$$ENDHEX$$DwObject	a_dwo	:$$HEX20$$83ff9eff70ff80ff73ff68ff9dff84ff9eff73ff75ff8cff9eff7cff9eff6aff78ff84ff0d000a00$$ENDHEX$$//
//$$HEX4$$3b62003024500900$$ENDHEX$$Long				:$$HEX4$$416870650d000a00$$ENDHEX$$//
//$$HEX4$$5c4f1062e5650900$$ENDHEX$$2000.11.16	Jupiter	T.Ohno
//-----------------------------------------------------------------------

/*
//-----------------------------------------------------------------------
//$$HEX14$$83ff70ff8cff9eff99ff88308a30416870656e30d653975f0d000a00$$ENDHEX$$//-----------------------------------------------------------------------
Long		ll_column_len
String	ls_buf

//char(12) --> 12)
ls_buf	= MidB(a_dwo.coltype, 6)

//12) --> 12
ls_buf	= LeftB(ls_buf, LenB(ls_buf) - 1)

ll_column_len	= Long(ls_buf)

Return ll_column_len
*/

//-----------------------------------------------------------------------
//$$HEX18$$83ff9eff70ff80ff73ff68ff9dff84ff9eff73ff6e302d8a9a5b416870659230d653975f$$ENDHEX$$($$HEX12$$74ff83ff9eff68ff6fff84ffe87dc696d8690f5f6e307f30$$ENDHEX$$)
//-----------------------------------------------------------------------
Long		ll_column_len

ll_column_len	= Long(This.Describe(a_dwo.name + ".Edit.Limit"))

Return ll_column_len

end function

public function boolean wf_mod_set (long al_row, string as_column_name, string as_data, integer ai_mode);/*--------------------------------------------------------------
$$HEX4$$0d540030f0790900$$ENDHEX$$wf_mod_set

$$HEX41$$ac8a00300e6609000967b9526a30ab30e930e0304b30693046304b3092302452ad6557300130095970656e308b576b30423063305f30bb30c330c83092304c8846300d000a000d000a00155f003070650900$$ENDHEX$$Long		al_row				$$HEX6$$4c880d000a00090009000900$$ENDHEX$$String	as_column_name		$$HEX9$$ab30e930e0300d540d000a00090009000900$$ENDHEX$$String	as_data				$$HEX8$$c730fc30bf300d000a00090009000900$$ENDHEX$$Int		ai_mode				$$HEX11$$c730fc30bf306e308b570d000a000900090009000900$$ENDHEX$$1:String 2:Dec 3:Date 4:DateTime

$$HEX4$$3b62003024500900$$ENDHEX$$Boolean
				true:$$HEX3$$10629f520900$$ENDHEX$$false:$$HEX10$$315957650d000a000d000a005c4f1062e5650900$$ENDHEX$$2004.01.10	Jupiter	Aki
--------------------------------------------------------------*/

String		ls_mod, ls_ret

ls_mod	=	as_column_name	+	".Font.Escapement = 0"
ls_ret	=	This.Modify(ls_mod)

If pf_nvl_string(ls_ret,	"") = "" Then
	
	Choose Case	ai_mode
		Case	1
			This.SetItem(al_row,	as_column_name,	as_data)
		Case	2
			This.SetItem(al_row,	as_column_name,	Dec(as_data))
		Case	3
			This.SetItem(al_row,	as_column_name,	Date(as_data))
		Case	4
			This.SetItem(al_row,	as_column_name,	DateTime(Date(as_data)))
	End Choose
	
	Return	TRUE
Else
	Return	FALSE
End If

end function

public function boolean wf_mod_get (long al_row, string as_column_name, ref string as_data, integer ai_mode);/*--------------------------------------------------------------
$$HEX4$$0d540030f0790900$$ENDHEX$$wf_mod_get

$$HEX41$$ac8a00300e6609000967b9526a30ab30e930e0304b30693046304b3092302452ad6557300130095970656e308b576b30423063305f30bb30c330c83092304c8846300d000a000d000a00155f003070650900$$ENDHEX$$Long		al_row				$$HEX6$$4c880d000a00090009000900$$ENDHEX$$String	as_column_name		$$HEX9$$ab30e930e0300d540d000a00090009000900$$ENDHEX$$String	as_data				$$HEX3$$c730fc30bf30$$ENDHEX$$(REF)
			Int		ai_mode				$$HEX11$$c730fc30bf306e308b570d000a000900090009000900$$ENDHEX$$1:String 2:Dec 3:Date 4:DateTime

$$HEX4$$3b62003024500900$$ENDHEX$$Boolean
				true:$$HEX3$$10629f520900$$ENDHEX$$false:$$HEX10$$315957650d000a000d000a005c4f1062e5650900$$ENDHEX$$2004.01.10	Jupiter	Aki
--------------------------------------------------------------*/

String		ls_mod, ls_ret

ls_mod	=	as_column_name	+	".Font.Escapement = 0"
ls_ret	=	This.Modify(ls_mod)

If pf_nvl_string(ls_ret,	"") = "" Then
	
	Choose Case	ai_mode
		Case	1
			as_data	=	pf_nvl_string(This.GetItemString(al_row,	as_column_name),	"")
		Case	2
			as_data	=	String(This.GetItemDecimal(al_row,	as_column_name))
		Case	3
			as_data	=	String(This.GetItemDate(al_row,	as_column_name))
		Case	4
			as_data	=	String(This.GetItemDateTime(al_row,	as_column_name))
	End Choose
	
	Return	TRUE
Else
	Return	FALSE
End If

end function

public function boolean wf_button_clicked (string as_column_name);
/*--------------------------------------------------------------
$$HEX4$$0d540030f0790900$$ENDHEX$$wf_keyopne

$$HEX41$$ac8a00300e6609000967b9526a30ab30e930e0304b30693046304b3092302452ad6557300130095970656e308b576b30423063305f30bb30c330c83092304c8846300d000a000d000a00155f003070650900$$ENDHEX$$String	as_column_name		$$HEX15$$ab30e930e0300d540d000a000900090009000d000a003b62003024500900$$ENDHEX$$Boolean
				true:$$HEX3$$10629f520900$$ENDHEX$$false:$$HEX10$$315957650d000a000d000a005c4f1062e5650900$$ENDHEX$$2004.04.02	Jupiter	Aki
--------------------------------------------------------------*/

String		ls_mod, ls_ret

ls_mod	=	as_column_name	+	".Font.Escapement = 0"
ls_ret	=	This.Modify(ls_mod)

If pf_nvl_string(ls_ret,	"") = "" Then
	
	This.SetColumn(as_column_name)
	This.TriggerEvent("KeyOpen")
	
	Return	TRUE
Else
	Return	FALSE
End If

end function

event rowfocuschanged;//If auto_selectrow Then
//	This.SelectRow(0,	FALSE)
//	If currentrow > 0 Then
//		This.SelectRow(currentrow,	TRUE)
//	End If
//End If

If auto_selectrow Then
	If currentrow > 0 Then
		This.Modify("	DataWindow.Detail.Color	=	'0~tIf(currentrow() = getrow(), RGB(255,192,192), RGB(255,255,255))'")
	End If
End If

end event

event retrieveend;//If auto_selectrow Then
//	This.SelectRow(0,	FALSE)
//	If rowcount > 0 Then
//		This.SetRow(1)
//		This.SelectRow(1,	TRUE)
//	End If
//End If

If auto_selectrow Then
	If rowcount > 0 Then
		This.SetRow(1)
		This.Modify("	DataWindow.Detail.Color	=	'0~tIf(currentrow() = getrow(), RGB(255,192,192), RGB(255,255,255))'")
	End If
End If

end event

event losefocus;This.AcceptText()

end event

event clicked;If row > 0 Then
	This.SetRow(row)
End If

end event

event itemchanged;//$$HEX7$$bc30ed30708ae65106740d000a00$$ENDHEX$$This.Post Event zero_pack(row, dwo, data)

end event

on com_pu_dw_s.create
end on

on com_pu_dw_s.destroy
end on

event dberror;
pf_db_err(This,	row,	sqldbcode,	sqlerrtext)
end event

event itemfocuschanged;This.SelectText(1,	256)
end event

event getfocus;com_pw_gparent	lw_w

lw_w	=	Parent_Window

lw_w.message_up("0")
end event

