HA$PBExportHeader$com_pu_dw.sru
$PBExportComments$$$HEX3$$997d7f624351$$ENDHEX$$DataWindow$$HEX5$$08ff71511a9028750130$$ENDHEX$$LEG(leg_pu_dw)$$HEX1$$6830$$ENDHEX$$MES(mes_pu_dw)$$HEX4$$6e30997d7f624351$$ENDHEX$$DataWindow$$HEX3$$6e30435109ff$$ENDHEX$$
forward
global type com_pu_dw from datawindow
end type
end forward

global type com_pu_dw from datawindow
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
global com_pu_dw com_pu_dw

type variables
Window		Parent_Window	//$$HEX1$$aa89$$ENDHEX$$Window
Boolean		Auto_SelectRow	//SelectRow
Boolean		Auto_EnterToTab	//Enter$$HEX1$$6730$$ENDHEX$$Tab
Boolean		Auto_InsertRow	//InsertRow
Boolean		auto_zero_pack	//$$HEX6$$7eff9eff9bff708a2452ad65$$ENDHEX$$

end variables

forward prototypes
public function long get_column_len (dwobject a_dwo)
public function boolean wf_mod_set (long al_row, string as_column_name, string as_data, integer ai_mode)
public function boolean wf_mod_get (long al_row, string as_column_name, ref string as_data, integer ai_mode)
public function boolean wf_button_clicked (string as_column_name)
public function integer wf_mod_chk (long al_row, string as_column_name, integer ai_mode)
public subroutine wf_ ()
public subroutine wf_date_change ()
public subroutine wf_date_change (long al_row, string as_data, string as_column, string as_prog_name)
public subroutine wf_itemchanged_kaiso (string as_dwo_name, string as_data, long al_row, string as_prog_name)
public subroutine wf_itemchanged_hinkubun (string as_dwo_name, string as_data, long al_row, string as_prog_name)
end prototypes

event key;/*************************************************************************************************
$$HEX9$$72ff9dff7dff80ff9dff7dff095970652000$$ENDHEX$$Auto_EnterToTab$$HEX1$$4c30$$ENDHEX$$TRUE$$HEX3$$6e3068304d30$$ENDHEX$$Enter$$HEX23$$77ff70ff67308cff6bff70ff76ff7dfffb79d552ef53fd800d000a0072ff9dff7dff80ff9dff7dff095970652000$$ENDHEX$$Auto_InsertRow$$HEX1$$4c30$$ENDHEX$$TRUE$$HEX1$$6730$$ENDHEX$$Last_Column$$HEX3$$6e3068304d30$$ENDHEX$$InsertAction$$HEX20$$a430d930f330c8309230778dd55259308b300d000a0072ff9dff7dff80ff9dff7dff095970652000$$ENDHEX$$Parent_Window$$HEX8$$6b3073ff68ff9dff84ff9eff73ff0d54$$ENDHEX$$
***********************************************/
Choose Case Key
	Case KeyEnter!	//Enter
		If auto_entertotab Then
			If auto_insertrow Then
				If This.Trigger Event InsertWhere() Then	//$$HEX17$$4c88fd8fa0526167f64ea430d930f330c83008ff997d7f6248516730188af08f09ff$$ENDHEX$$
					This.Trigger Event InsertAction()	//$$HEX17$$4c88fd8fa052e6510674a430d930f330c83008ff997d7f6248516730188af08f09ff$$ENDHEX$$
					Send(Handle(This), 256, 9, Long(0, 0))
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
			If This.Trigger Event InsertWhere() Then	//$$HEX17$$4c88fd8fa0526167f64ea430d930f330c83008ff997d7f6248516730188af08f09ff$$ENDHEX$$
				This.Trigger Event InsertAction()	//$$HEX17$$4c88fd8fa052e6510674a430d930f330c83008ff997d7f6248516730188af08f09ff$$ENDHEX$$
			End If
		End If
		Return 0
		
	Case gstr_kaisya.key[9]
//		This.Trigger Event keyopen()	2007.08.30 del 
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

event insertaction();//$$HEX3$$4c88fd8fa052$$ENDHEX$$
this.InsertRow(0)
end event

event type boolean insertwhere();//.insertwhere
//$$HEX29$$0067427d4c886730013065519b52ef53fd80ab30e930e0306e30693053304b304c3065519b5255308c305f3068304d30b0658f894c88fd8fa052$$ENDHEX$$
Long				ll_row, ll_max
DWItemStatus 	ldwis_sta

This.AcceptText()

ll_row = This.getrow()		//$$HEX3$$fe734c884c88$$ENDHEX$$
ll_max = This.rowcount()	//$$HEX3$$0067427d4c88$$ENDHEX$$
ldwis_sta = This.getitemstatus(ll_row, 0, Primary!)

If ll_row = ll_max AND (ldwis_sta = DataModified! OR ldwis_sta = NewModified!) Then
	Return true
Else
	Return false
End If
end event

event keyopen();/*___/___/___/___/___/___/____/___/___/___/___/___/___/____/___/___/___/___/___/___/____/

$$HEX13$$ac8a0e660900997d7f626b30663071511a90ab30e930e0306e30$$ENDHEX$$Keyopen$$HEX6$$e651067492304c8846300230$$ENDHEX$$
		itemchanged$$HEX23$$68306e30e65106746e300c541f679230d6538b305f3081300130c730fc30bf30d653975f8c5f6e30e65106746f30$$ENDHEX$$itemchanged$$HEX5$$6b3066304c8846300230$$ENDHEX$$
		
		1.com_pw.pbl$$HEX4$$6830bb30c330c830$$ENDHEX$$
		
		2.$$HEX20$$ab30e930e0306e30585b2857c130a730c330af308c5f6b30e65106749230188af08f59308b300230$$ENDHEX$$(wf_mod_get)
			//$$HEX16$$de56e28ed2896b3088308b30ab30e930e0306e30585b2857c130a730c330af30$$ENDHEX$$
			ls_mod	=	This.Modify("$$HEX4$$c154ee766a75f753$$ENDHEX$$.Font.Escapement = 0")
			
		3.$$HEX36$$d730ed30b030e930e030fa5609676e30ab30e930e0306e30345808540c30d730ed30b030e930e03029ff24ff0d309230b330e130f330c8306730fd8f188a59308b30533068300230$$ENDHEX$$
			$$HEX1$$8b4f$$ENDHEX$$
				//$$HEX7$$7a76e86c58534d4fb330fc30c930$$ENDHEX$$
				//mes_h01,mes_h02,$$HEX3$$fb30fb30fb30$$ENDHEX$$etc.
		
		4.scm_pu_dw$$HEX1$$0130$$ENDHEX$$mes_pu_dw$$HEX1$$6e30$$ENDHEX$$Keyopen$$HEX15$$a430d930f330c8306e30188af08f6830cd91078957306a30443053306830$$ENDHEX$$
		
		$$HEX15$$e86c0f6108ffe265585bd730ed30b030e930e0306b30fe5b5730663009ff$$ENDHEX$$
			$$HEX19$$53306e30e65106749230997d7f62485167302a51485184766b306990287559308b306b306f30$$ENDHEX$$
			$$HEX1$$7021$$ENDHEX$$) $$HEX8$$e130cb30e530fc306e300c30e87dc696$$ENDHEX$$(E)$$HEX27$$0d30d2210c3048515679b930af30ea30d730c8309230e162355f0d306b30c130a730c330af304c306551633066304a308a304b306430$$ENDHEX$$
			$$HEX33$$0030997d7f6248516e30b930af30ea30d730c8304c300130b330e130f330c830823057304f306f304a52649655308c30663044308b30c55f81894c3042308b300230$$ENDHEX$$
			$$HEX37$$003000300c3048515679b930af30ea30d730c8309230e162355f0d306b30c130a730c330af304c3065516330663044306a30443068300130b330e130f330c83067304230633066308230$$ENDHEX$$
			$$HEX15$$0030997d7f6248516e30188af08f4c300a4ef8664d3055308c308b300230$$ENDHEX$$
			$$HEX38$$712109ff0c3048515679b930af30ea30d730c8309230e162355f0d306b30c130a730c330af304c306551633066304a308a304b306430997d7f6248516b308230188af08f4c3042308c307030$$ENDHEX$$
			$$HEX18$$003053306e30e65106748c5f0130997d7f6248514c309f5b4c8855308c308b305f308130$$ENDHEX$$Keyopen$$HEX1$$0130$$ENDHEX$$Buttonclicked$$HEX2$$67306f30$$ENDHEX$$2$$HEX7$$de56e65106744c309f5b4c885530$$ENDHEX$$
			$$HEX14$$00308c308b305f308130e86c0f614c30c55f8189673042308b300230$$ENDHEX$$
			
$$HEX4$$5c4f1062e5650900$$ENDHEX$$2004.01.07	jupiter	tada

$$HEX4$$f466b065e5650900$$ENDHEX$$
	
___/___/___/___/___/___/____/___/___/___/___/___/___/____/___/___/___/___/___/___/____/ */

Long		ll_row
String	ls_column, ls_prog_name
String	ls_moji, ls_kana, ls_moji2, ls_moji_b
//String	ls_uriage, ls_seikyu, ls_siire, ls_siharai, ls_nouhin, ls_nyuukin_kbn
//String	ls_kbn, ls_tanka_kbn
//String	ls_sts[19]

DwObject	ldwo_my
//
ps_prog		lstr_prog
ps_tani		lstr_tani
ps_tanto		lstr_tanto
ps_hin		lstr_hin
//ps_torihiki	lstr_torihiki
ps_hinkubun	lstr_hinkubun
//ps_file		lstr_file
ps_bumon		lstr_bumon
ps_bumon		lstr_bumon2
ps_tkubun	lstr_tkubun
ps_riyu		lstr_riyu
ps_kamoku	lstr_kamoku
////ADD-S	2007.1.24
ps_koutei	lstr_koutei
ps_line		lstr_line
//ps_nonyubin	lstr_nonyubin
////ADD-E	2007.1.24
//
ps_team		lstr_team
ps_event		lstr_event
ps_gun		lstr_gun
ps_kaiso_hin_kubun		lstr_kaiso_h_kbn
ps_haifu		lstr_haifu
ps_himoku	lstr_himoku
ps_printer	lstr_printer

ps_togo_line	lstr_togo_line
ps_kinmu			lstr_kinmu

String		ls_date
ps_syohin	lstr_syohin
ps_torihiki	lstr_torihiki

ps_a_bunrui		lstr_a_bunrui

/*---------------------------------------------------------------------------------------
	$$HEX13$$4c880130ab30e930e0300130d730ed30b030e930e03029ff24ff$$ENDHEX$$($$HEX3$$27598765575b$$ENDHEX$$)$$HEX3$$6e30d653975f$$ENDHEX$$
---------------------------------------------------------------------------------------*/
ll_row			= This.GetRow()
ls_column		= This.GetColumnName()
ls_prog_name	= Upper(pf_nvl_string(gstr_kaisya.prog_name, ""))


/*---------------------------------------------------------------------------------------
	$$HEX3$$71511a902000$$ENDHEX$$keyopen $$HEX2$$e6510674$$ENDHEX$$
---------------------------------------------------------------------------------------*/
Choose Case ls_column
	
	/*------------------------------------------------------------------------------------
		$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case "$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$","$$HEX8$$d54e6551c562535f0580b330fc30c930$$ENDHEX$$", "$$HEX8$$ba788d8ac562535f0580b330fc30c930$$ENDHEX$$", "$$HEX8$$f466b065c562535f0580b330fc30c930$$ENDHEX$$"
		
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
			lstr_tanto.$$HEX4$$745e086709000900$$ENDHEX$$= Datetime(Date(ls_date))
		End if
		
		Choose Case ls_column
			Case "$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$
			Case "$$HEX8$$d54e6551c562535f0580b330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX8$$d54e6551c562535f0580b330fc30c930$$ENDHEX$$
			Case "$$HEX8$$ba788d8ac562535f0580b330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX8$$ba788d8ac562535f0580b330fc30c930$$ENDHEX$$
			case "$$HEX8$$f466b065c562535f0580b330fc30c930$$ENDHEX$$"
				ldwo_my	= this.object.$$HEX8$$f466b065c562535f0580b330fc30c930$$ENDHEX$$
		End Choose
		
		If ls_prog_name <> "COM_M12" Then //$$HEX6$$c562535f0580de30b930bf30$$ENDHEX$$
			If pf_open_tanto(lstr_tanto) Then
				This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_tanto.$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$)
			End If
		End If
		
	/*------------------------------------------------------------------------------------
		$$HEX5$$d730ed30b030e930e030$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case "$$HEX5$$d730ed30b030e930e030$$ENDHEX$$"
		If ls_prog_name <> "COM_M04" Then //$$HEX8$$d730ed30b030e930e030de30b930bf30$$ENDHEX$$
			If pf_open_prog(lstr_prog) Then
				This.Trigger Event Itemchanged(ll_row, This.Object.$$HEX5$$d730ed30b030e930e030$$ENDHEX$$, lstr_prog.$$HEX5$$d730ed30b030e930e030$$ENDHEX$$)
			End If
		End If
		
	/*------------------------------------------------------------------------------------
		$$HEX4$$c154ee766a75f753$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX4$$c154ee766a75f753$$ENDHEX$$","$$HEX7$$2f63ff664d52c154ee766a75f753$$ENDHEX$$","$$HEX7$$2f63ff668c5fc154ee766a75f753$$ENDHEX$$","$$HEX6$$2375fa51c154ee766a75f753$$ENDHEX$$","$$HEX6$$95626551c154ee766a75f753$$ENDHEX$$","$$HEX6$$fe5bd46bc154ee766a75f753$$ENDHEX$$", &
			"$$HEX9$$2375fa51ef53fd80c154ee766a75f75311ff$$ENDHEX$$" ,"$$HEX9$$2375fa51ef53fd80c154ee766a75f75312ff$$ENDHEX$$" ,"$$HEX9$$2375fa51ef53fd80c154ee766a75f75313ff$$ENDHEX$$",	&
			"$$HEX9$$95626551ef53fd80c154ee766a75f75311ff$$ENDHEX$$" ,"$$HEX9$$95626551ef53fd80c154ee766a75f75312ff$$ENDHEX$$" ,"$$HEX9$$95626551ef53fd80c154ee766a75f75313ff$$ENDHEX$$",	&
			"$$HEX6$$e34eff66c154ee766a75f753$$ENDHEX$$", "$$HEX6$$8b95cb59c154ee766a75f753$$ENDHEX$$", "$$HEX6$$427d864ec154ee766a75f753$$ENDHEX$$", "$$HEX5$$505bc154ee766a75f753$$ENDHEX$$", "$$HEX7$$fa516567d89ac154ee766a75f753$$ENDHEX$$"
		
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
			lstr_hin.$$HEX4$$745e086709000900$$ENDHEX$$= Datetime(Date(ls_date))
		End if
		
		ls_moji_b	= ""
		Choose Case	ls_column
			Case	"$$HEX4$$c154ee766a75f753$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX4$$c154ee766a75f753$$ENDHEX$$
			Case	"$$HEX7$$2f63ff664d52c154ee766a75f753$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX7$$2f63ff664d52c154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX3$$2f63ff664d52$$ENDHEX$$"
			Case	"$$HEX7$$2f63ff668c5fc154ee766a75f753$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX7$$2f63ff668c5fc154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX3$$2f63ff668c5f$$ENDHEX$$"
			Case	"$$HEX6$$2375fa51c154ee766a75f753$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX6$$2375fa51c154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX2$$2375fa51$$ENDHEX$$"
			Case	"$$HEX6$$95626551c154ee766a75f753$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX6$$95626551c154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX2$$95626551$$ENDHEX$$"
			Case	"$$HEX6$$fe5bd46bc154ee766a75f753$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX6$$fe5bd46bc154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX2$$fe5bd46b$$ENDHEX$$"		
			Case	"$$HEX9$$2375fa51ef53fd80c154ee766a75f75311ff$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX9$$2375fa51ef53fd80c154ee766a75f75311ff$$ENDHEX$$
				ls_moji	= "$$HEX4$$2375fa51ef53fd80$$ENDHEX$$"
				ls_moji_b	= "$$HEX1$$11ff$$ENDHEX$$"
			Case	"$$HEX9$$2375fa51ef53fd80c154ee766a75f75312ff$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX9$$2375fa51ef53fd80c154ee766a75f75312ff$$ENDHEX$$
				ls_moji	= "$$HEX4$$2375fa51ef53fd80$$ENDHEX$$"
				ls_moji_b	= "$$HEX1$$12ff$$ENDHEX$$"
			Case	"$$HEX9$$2375fa51ef53fd80c154ee766a75f75313ff$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX9$$2375fa51ef53fd80c154ee766a75f75313ff$$ENDHEX$$
				ls_moji	= "$$HEX4$$2375fa51ef53fd80$$ENDHEX$$"
				ls_moji_b	= "$$HEX1$$13ff$$ENDHEX$$"
			Case	"$$HEX9$$95626551ef53fd80c154ee766a75f75311ff$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX9$$95626551ef53fd80c154ee766a75f75311ff$$ENDHEX$$
				ls_moji	= "$$HEX4$$95626551ef53fd80$$ENDHEX$$"
				ls_moji_b	= "$$HEX1$$11ff$$ENDHEX$$"
			Case	"$$HEX9$$95626551ef53fd80c154ee766a75f75312ff$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX9$$95626551ef53fd80c154ee766a75f75312ff$$ENDHEX$$
				ls_moji	= "$$HEX4$$95626551ef53fd80$$ENDHEX$$"
				ls_moji_b	= "$$HEX1$$12ff$$ENDHEX$$"
			Case	"$$HEX9$$95626551ef53fd80c154ee766a75f75313ff$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX9$$95626551ef53fd80c154ee766a75f75313ff$$ENDHEX$$
				ls_moji	= "$$HEX4$$95626551ef53fd80$$ENDHEX$$"
				ls_moji_b	= "$$HEX1$$13ff$$ENDHEX$$"
			Case	"$$HEX6$$e34eff66c154ee766a75f753$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX6$$e34eff66c154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX2$$e34eff66$$ENDHEX$$"
			case "$$HEX6$$8b95cb59c154ee766a75f753$$ENDHEX$$"
				ldwo_my	= this.object.$$HEX6$$8b95cb59c154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX2$$8b95cb59$$ENDHEX$$"
			case "$$HEX6$$427d864ec154ee766a75f753$$ENDHEX$$"
				ldwo_my	= this.object.$$HEX6$$427d864ec154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX2$$427d864e$$ENDHEX$$"
			case "$$HEX5$$505bc154ee766a75f753$$ENDHEX$$"
				ldwo_my	= this.object.$$HEX5$$505bc154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX1$$505b$$ENDHEX$$"
			case "$$HEX7$$fa516567d89ac154ee766a75f753$$ENDHEX$$"
				ldwo_my	= this.object.$$HEX7$$fa516567d89ac154ee766a75f753$$ENDHEX$$
				ls_moji	= "$$HEX3$$fa516567d89a$$ENDHEX$$"
		End Choose
		
		//$$HEX13$$0526cb691062de30b930bf3095626551c154004eec620959db63$$ENDHEX$$
		If ls_prog_name = 'COM_M41C' AND ls_moji = "$$HEX2$$e34eff66$$ENDHEX$$" Then
			wf_mod_get(ll_row, "$$HEX7$$0959db634d52c78c23752e7a5e98$$ENDHEX$$", lstr_hin.$$HEX4$$c78c23752e7a5e98$$ENDHEX$$, 1)
			wf_mod_get(ll_row, "$$HEX7$$0959db634d52c154ee766a75f753$$ENDHEX$$", lstr_hin.$$HEX4$$c154ee766a75f753$$ENDHEX$$, 1)
			If pf_open_hin_daigae(lstr_hin) Then
				wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", String(lstr_hin.$$HEX2$$745e0867$$ENDHEX$$),	 4)
				wf_mod_set(ll_row, ls_column, lstr_hin.$$HEX4$$c154ee766a75f753$$ENDHEX$$, 1)
				wf_mod_set(ll_row, ls_moji + "$$HEX4$$c78c23752e7a5e98$$ENDHEX$$" + ls_moji_b, lstr_hin.$$HEX4$$c78c23752e7a5e98$$ENDHEX$$, 1)
				This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_hin.$$HEX4$$c154ee766a75f753$$ENDHEX$$)
			End If
		Else
			//$$HEX15$$0526cb691062de30b930bf3095626551c154004eec620959db63e54e1659$$ENDHEX$$
			wf_mod_get(ll_row, ls_moji + "$$HEX4$$c78c23752e7a5e98$$ENDHEX$$" + ls_moji_b, lstr_hin.$$HEX4$$c78c23752e7a5e98$$ENDHEX$$, 1)
			wf_mod_get(ll_row, ls_moji +"$$HEX5$$4655c154b330fc30c930$$ENDHEX$$" + ls_moji_b, lstr_hin.$$HEX5$$4655c154b330fc30c930$$ENDHEX$$, 1)
			
			If pf_open_hin(lstr_hin) Then
				wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", String(lstr_hin.$$HEX2$$745e0867$$ENDHEX$$),	 4)
				wf_mod_set(ll_row, ls_column, lstr_hin.$$HEX4$$c154ee766a75f753$$ENDHEX$$, 1)
				wf_mod_set(ll_row, ls_moji + "$$HEX4$$c78c23752e7a5e98$$ENDHEX$$" + ls_moji_b, lstr_hin.$$HEX4$$c78c23752e7a5e98$$ENDHEX$$, 1)
	//			wf_mod_set(ll_row, ls_moji +"$$HEX5$$4655c154b330fc30c930$$ENDHEX$$" + ls_moji_b, lstr_hin.$$HEX5$$4655c154b330fc30c930$$ENDHEX$$, 1)
				This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_hin.$$HEX4$$c154ee766a75f753$$ENDHEX$$)
			End If
		
		End If

	/*------------------------------------------------------------------------------------
		$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	// $$HEX10$$c154ee76255258534d4fde30b930bf301c69227d$$ENDHEX$$
	Case	"$$HEX7$$c154ee7658534d4fb330fc30c930$$ENDHEX$$", "$$HEX7$$7a76e86c58534d4fb330fc30c930$$ENDHEX$$","$$HEX7$$6972416d58534d4fb330fc30c930$$ENDHEX$$"
		If ls_prog_name <> "COM_M15" Then
			Choose Case	ls_column
				Case	"$$HEX7$$c154ee7658534d4fb330fc30c930$$ENDHEX$$"
					ldwo_my	= This.Object.$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$
				Case	"$$HEX7$$7a76e86c58534d4fb330fc30c930$$ENDHEX$$"
					ldwo_my	= This.Object.$$HEX7$$7a76e86c58534d4fb330fc30c930$$ENDHEX$$
				Case	"$$HEX7$$6972416d58534d4fb330fc30c930$$ENDHEX$$"
					ldwo_my	= This.Object.$$HEX7$$6972416d58534d4fb330fc30c930$$ENDHEX$$
			End Choose

			wf_mod_get(ll_row,	"$$HEX4$$c154ee766a75f753$$ENDHEX$$",			lstr_tani.$$HEX4$$c154ee766a75f753$$ENDHEX$$,	1)
			If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
				lstr_tani.$$HEX4$$745e086709000900$$ENDHEX$$= Datetime(Date(ls_date))
			End if
			If pf_open_hin_tani(lstr_tani) Then
				This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_tani.$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$)
			End If
		End If
	
	// $$HEX7$$58534d4fde30b930bf301c69227d$$ENDHEX$$
	Case	"$$HEX7$$00670f5c58534d4fb330fc30c930$$ENDHEX$$", "$$HEX7$$2d4e939558534d4fb330fc30c930$$ENDHEX$$", "$$HEX7$$0067275958534d4fb330fc30c930$$ENDHEX$$","$$HEX7$$9562655158534d4fb330fc30c930$$ENDHEX$$",&
			"$$HEX7$$fc8cb78c58534d4fb330fc30c930$$ENDHEX$$", "$$HEX7$$886dbb8c58534d4fb330fc30c930$$ENDHEX$$"
		
		Choose Case	ls_column
			Case	"$$HEX7$$00670f5c58534d4fb330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX7$$00670f5c58534d4fb330fc30c930$$ENDHEX$$
			Case	"$$HEX7$$2d4e939558534d4fb330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX7$$2d4e939558534d4fb330fc30c930$$ENDHEX$$
			Case	"$$HEX7$$0067275958534d4fb330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX7$$0067275958534d4fb330fc30c930$$ENDHEX$$
			Case	"$$HEX7$$9562655158534d4fb330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX7$$9562655158534d4fb330fc30c930$$ENDHEX$$
			Case	"$$HEX7$$fc8cb78c58534d4fb330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX7$$fc8cb78c58534d4fb330fc30c930$$ENDHEX$$
			Case	"$$HEX7$$886dbb8c58534d4fb330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX7$$886dbb8c58534d4fb330fc30c930$$ENDHEX$$
		End Choose
		
		If pf_open_tani(lstr_tani)	Then
			This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_tani.$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$)
		end if

	Case	"$$HEX7$$cd91cf9158534d4fb330fc30c930$$ENDHEX$$"
		If pf_open_jyuryo_tani(lstr_tani)	Then
			This.Trigger Event Itemchanged(ll_row, This.Object.$$HEX7$$cd91cf9158534d4fb330fc30c930$$ENDHEX$$, lstr_tani.$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$)
		end if


	/*------------------------------------------------------------------------------------
		$$HEX4$$c1540d543a530652$$ENDHEX$$01$$HEX1$$5eff$$ENDHEX$$20
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$c1540d543a53065211ff$$ENDHEX$$", "$$HEX5$$c1540d543a53065212ff$$ENDHEX$$", "$$HEX5$$c1540d543a53065213ff$$ENDHEX$$", "$$HEX5$$c1540d543a53065214ff$$ENDHEX$$", "$$HEX5$$c1540d543a53065215ff$$ENDHEX$$", &
			"$$HEX5$$c1540d543a53065216ff$$ENDHEX$$", "$$HEX5$$c1540d543a53065217ff$$ENDHEX$$", "$$HEX5$$c1540d543a53065218ff$$ENDHEX$$", "$$HEX5$$c1540d543a53065219ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff10ff$$ENDHEX$$", &
			"$$HEX6$$c1540d543a53065211ff11ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff12ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff13ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff14ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff15ff$$ENDHEX$$", &
			"$$HEX6$$c1540d543a53065211ff16ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff17ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff18ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff19ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065212ff10ff$$ENDHEX$$"
			
			Choose Case	ls_column
				Case	"$$HEX5$$c1540d543a53065211ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "01"
					ldwo_my	= This.Object.$$HEX5$$c1540d543a53065211ff$$ENDHEX$$
				Case	"$$HEX5$$c1540d543a53065212ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "02"
					ldwo_my	= This.Object.$$HEX5$$c1540d543a53065212ff$$ENDHEX$$
				Case	"$$HEX5$$c1540d543a53065213ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "03"
					ldwo_my	= This.Object.$$HEX5$$c1540d543a53065213ff$$ENDHEX$$
				Case	"$$HEX5$$c1540d543a53065214ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "04"
					ldwo_my	= This.Object.$$HEX5$$c1540d543a53065214ff$$ENDHEX$$
				Case	"$$HEX5$$c1540d543a53065215ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "05"
					ldwo_my	= This.Object.$$HEX5$$c1540d543a53065215ff$$ENDHEX$$
				Case	"$$HEX5$$c1540d543a53065216ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "06"
					ldwo_my	= This.Object.$$HEX5$$c1540d543a53065216ff$$ENDHEX$$
				Case	"$$HEX5$$c1540d543a53065217ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "07"
					ldwo_my	= This.Object.$$HEX5$$c1540d543a53065217ff$$ENDHEX$$
				Case	"$$HEX5$$c1540d543a53065218ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "08"
					ldwo_my	= This.Object.$$HEX5$$c1540d543a53065218ff$$ENDHEX$$
				Case	"$$HEX5$$c1540d543a53065219ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "09"
					ldwo_my	= This.Object.$$HEX5$$c1540d543a53065219ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff10ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "10"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff10ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff11ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "11"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff11ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff12ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "12"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff12ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff13ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "13"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff13ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff14ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "14"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff14ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff15ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "15"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff15ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff16ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "16"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff16ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff17ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "17"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff17ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff18ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "18"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff18ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065211ff19ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "19"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065211ff19ff$$ENDHEX$$
				Case	"$$HEX6$$c1540d543a53065212ff10ff$$ENDHEX$$"
					lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= "20"
					ldwo_my	= This.Object.$$HEX6$$c1540d543a53065212ff10ff$$ENDHEX$$
			End Choose
			
			If pf_open_hinkubun(lstr_hinkubun) Then
				This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_hinkubun.$$HEX7$$c1540d543a530652b330fc30c930$$ENDHEX$$)
			End If
			
	/*------------------------------------------------------------------------------------
		$$HEX4$$d653155f3a530652$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX4$$d653155f3a530652$$ENDHEX$$"
		If ls_prog_name <> "COM_M02" Then	/* com_m02 $$HEX8$$d653155f3a530652de30b930bf302000$$ENDHEX$$*/
			
			if ls_prog_name = "MES_Z03" or ls_prog_name = "MES_Z05" then
				lstr_tkubun.$$HEX9$$4c7dbb8c2f63ff6665519b523b7562972000$$ENDHEX$$= "1"
			elseif ls_prog_name = "MES_N04" then	/* mes_n04 $$HEX5$$d54e655165519b522000$$ENDHEX$$*/
				lstr_tkubun.$$HEX7$$d54e655165519b523b7562972000$$ENDHEX$$= "1"
			end if
			
			
			If pf_open_tkubun(lstr_tkubun) Then
				wf_mod_set(ll_row,"$$HEX4$$d653155f3a530652$$ENDHEX$$",	lstr_tkubun.$$HEX4$$d653155f3a530652$$ENDHEX$$,	1)
				This.Trigger Event Itemchanged(ll_row, This.Object.$$HEX4$$d653155f3a530652$$ENDHEX$$, lstr_tkubun.$$HEX4$$d653155f3a530652$$ENDHEX$$)
			End If
		End If
		
	/*------------------------------------------------------------------------------------
		$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$"
		ldwo_my	=	This.Object.$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$
		
		If	pf_open_kamoku(lstr_kamoku)	Then
			wf_mod_set(ll_row, "$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$", lstr_kamoku.$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$, 1)
			This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_kamoku.$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$)
		End if

	Case	"$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$", "$$HEX6$$4d52e55d0b7ab330fc30c930$$ENDHEX$$"
		Choose Case	ls_column
			Case	"$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$
			Case	"$$HEX6$$4d52e55d0b7ab330fc30c930$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX6$$4d52e55d0b7ab330fc30c930$$ENDHEX$$
		End Choose
		
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
			lstr_koutei.$$HEX4$$745e086709000900$$ENDHEX$$= Datetime(Date(ls_date))
		End if
		
		//$$HEX22$$d830c330c0306b3065519b524c3042308c30703001301d521f6724506830573066303c680d7d59308b300230$$ENDHEX$$
		If ls_column = "$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$" Then
			wf_mod_get(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_koutei.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 	1)
			
			If	Not wf_mod_get(ll_row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$",		 lstr_koutei.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,		1)	Then
				wf_mod_get(ll_row, "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$",		 lstr_koutei.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,		1)
			End if
			
			wf_mod_get(ll_row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$"  , lstr_koutei.$$HEX8$$c130fc30e030b330fc30c93020002000$$ENDHEX$$,	1)
			wf_mod_get(ll_row, "$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$"  , lstr_koutei.$$HEX8$$e930a430f330b330fc30c93020002000$$ENDHEX$$,	1)
		End If
		
		If pf_open_koutei(lstr_koutei) Then
			If ls_column = "$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$" Then 
				wf_mod_set(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$"	, lstr_koutei.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$, 1)
				wf_mod_set(ll_row, "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$"	, lstr_koutei.$$HEX8$$e55d3458e89080950d54f07909000900$$ENDHEX$$, 1)
				
				wf_mod_set(ll_row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$"	, lstr_koutei.$$HEX6$$e8908095b330fc30c9300900$$ENDHEX$$, 	1)
				wf_mod_set(ll_row, "$$HEX4$$e89080950d54f079$$ENDHEX$$"	, lstr_koutei.$$HEX6$$e89080950d54f07909000900$$ENDHEX$$, 		1)
				
				wf_mod_set(ll_row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$"	, lstr_koutei.$$HEX7$$c130fc30e030b330fc30c9300900$$ENDHEX$$, 1)
				wf_mod_set(ll_row, "$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$"		, lstr_koutei.$$HEX6$$c130fc30e0300d54f0790900$$ENDHEX$$, 1)
				
				wf_mod_set(ll_row, "$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$"	, lstr_koutei.$$HEX7$$e930a430f330b330fc30c9300900$$ENDHEX$$, 1)
				wf_mod_set(ll_row, "$$HEX5$$e930a430f3300d54f079$$ENDHEX$$"		, lstr_koutei.$$HEX6$$e930a430f3300d54f0790900$$ENDHEX$$, 1)
				
				wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$",					String(lstr_koutei.$$HEX2$$745e0867$$ENDHEX$$),	 	4)
			
				This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_koutei.$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$)
			End If
			
		End If
		
	Case	"$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$", "$$HEX8$$f8764b62e930a430f330b330fc30c930$$ENDHEX$$"
		Choose case ls_column
			Case	"$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$"
				ldwo_my	=	This.Object.$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$
				ls_moji	=	""
			Case	"$$HEX8$$f8764b62e930a430f330b330fc30c930$$ENDHEX$$"
				ldwo_my	=	This.Object.$$HEX8$$f8764b62e930a430f330b330fc30c930$$ENDHEX$$
				ls_moji	=	"$$HEX2$$f8764b62$$ENDHEX$$"
		End Choose
		
		//$$HEX22$$d830c330c0306b3065519b524c3042308c30703001301d521f6724506830573066303c680d7d59308b300230$$ENDHEX$$
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
			lstr_line.$$HEX3$$745e08670900$$ENDHEX$$= Datetime(Date(ls_date))
		Else
			setNull(lstr_line.$$HEX2$$745e0867$$ENDHEX$$)
		End if
		
		If ls_column = "$$HEX8$$f8764b62e930a430f330b330fc30c930$$ENDHEX$$" Then
			wf_mod_get(ll_row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", lstr_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
		Else
			If	Not wf_mod_get(ll_row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)	Then
				lstr_line.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= ""
			End if
			
			If	not wf_mod_get(ll_row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", lstr_line.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)	Then
				wf_mod_get(ll_row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", lstr_line.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
			End if
		End If
		
		wf_mod_get(ll_row, ls_moji + "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$"	, lstr_line.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 1)
		
		wf_mod_get(ll_row, "$$HEX5$$e930a430f3303a530652$$ENDHEX$$"	, lstr_line.$$HEX5$$e930a430f3303a530652$$ENDHEX$$, 1)
		
		If	pf_open_line(lstr_line)	Then
			wf_mod_set(ll_row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_line.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$, 1)
			wf_mod_set(ll_row, ls_moji + "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$"	, lstr_line.$$HEX8$$e55d3458e89080950d54f07909000900$$ENDHEX$$, 1)
			
			wf_mod_set(ll_row, ls_moji + "$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$", lstr_line.$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$, 1)
			
			wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$",					String(lstr_line.$$HEX2$$745e0867$$ENDHEX$$), 	4)
			
			wf_mod_set(ll_row, "$$HEX5$$e930a430f3303a530652$$ENDHEX$$"		, lstr_line.$$HEX5$$e930a430f3303a530652$$ENDHEX$$, 1)
			
			This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_line.$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$)

		End if
	/*------------------------------------------------------------------------------------
		$$HEX5$$717d0854e930a430f330$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$"
		
		ldwo_my	=	This.Object.$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$
		ls_moji	=	""
	
		//$$HEX22$$d830c330c0306b3065519b524c3042308c30703001301d521f6724506830573066303c680d7d59308b300230$$ENDHEX$$
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
			lstr_togo_line.$$HEX3$$745e08670900$$ENDHEX$$= Datetime(Date(ls_date))
		Else
			setNull(lstr_togo_line.$$HEX2$$745e0867$$ENDHEX$$)
		End if
		
		wf_mod_get(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_togo_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
		
		If	pf_open_togo_line(lstr_togo_line)	Then
			
			wf_mod_set(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$",	lstr_togo_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$,	1)
			wf_mod_set(ll_row, "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$",		lstr_togo_line.$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$,		1)
			wf_mod_set(ll_row, "$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$", lstr_togo_line.$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$, 1)
			This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_togo_line.$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$)

		End if
	/*------------------------------------------------------------------------------------
		$$HEX2$$06743175$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$06743175b330fc30c930$$ENDHEX$$"
		
		Choose Case ls_column
			Case "$$HEX5$$06743175b330fc30c930$$ENDHEX$$"
				ls_moji	= ""
				ldwo_my	= This.Object.$$HEX5$$06743175b330fc30c930$$ENDHEX$$
		End Choose
		
		If pf_open_riyu(lstr_riyu) Then
			This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_riyu.$$HEX5$$06743175b330fc30c930$$ENDHEX$$)
		End If

	/*------------------------------------------------------------------------------------
		$$HEX2$$e8908095$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$","$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$","$$HEX8$$2f63ff664851e8908095b330fc30c930$$ENDHEX$$","$$HEX9$$fa51ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$","$$HEX9$$6551ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$" &
			,"$$HEX7$$f8764b62e8908095b330fc30c930$$ENDHEX$$", "$$HEX8$$4351e55d3458e8908095b330fc30c930$$ENDHEX$$", "$$HEX8$$4851e55d3458e8908095b330fc30c930$$ENDHEX$$", "$$HEX6$$4851e8908095b330fc30c930$$ENDHEX$$"
			
		Choose Case	ls_column
			Case	"$$HEX5$$e8908095b330fc30c930$$ENDHEX$$"
				Choose Case ls_prog_name
					Case "COM_G06"		//$$HEX9$$9f53a14f196a966e3fffc38c877365519b52$$ENDHEX$$
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "2"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3] = "3"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[4] = "4"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[5] = "5"
					case "COM_G84"		//$$HEX11$$0867216bfd8820904c7dbb8c884e9f5bfe5bd46b6888$$ENDHEX$$
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "2"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3] = "3"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[4] = "4"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[5] = "5"
					Case Else
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3] = "5"
					End Choose
					
					wf_mod_get(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
					ls_moji	= ""
					ldwo_my	= This.Object.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$
			Case	"$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX2$$e55d3458$$ENDHEX$$"
		
				If	ls_prog_name = "COM_M11"	Then
					wf_mod_get(ll_row, "$$HEX4$$e89080953a530652$$ENDHEX$$", lstr_bumon.$$HEX4$$e89080953a530652$$ENDHEX$$, 1)
						
					Choose Case	lstr_bumon.$$HEX4$$e89080953a530652$$ENDHEX$$
						Case	"2"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "1"
						Case	"4", "5"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "3"
						Case	"7"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "6"
						Case	Else
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
					End Choose
				Else
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
				End If
				
				ldwo_my	= This.Object.$$HEX10$$e55d3458e8908095b330fc30c930090009000900$$ENDHEX$$
			Case	"$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX1$$c24f$$ENDHEX$$"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "5"
				ldwo_my	= This.Object.$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$
				wf_mod_get(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
			Case	"$$HEX8$$2f63ff664851e8908095b330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX3$$2f63ff664851$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX8$$2f63ff664851e8908095b330fc30c930$$ENDHEX$$
			Case	"$$HEX9$$fa51ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX4$$fa51ab5ee55d3458$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX9$$fa51ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
			Case	"$$HEX9$$6551ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX4$$6551ab5ee55d3458$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX9$$6551ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
			Case	"$$HEX7$$f8764b62e8908095b330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX2$$f8764b62$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX7$$f8764b62e8908095b330fc30c930$$ENDHEX$$
			Case	"$$HEX8$$4351e55d3458e8908095b330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX3$$4351e55d3458$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX8$$4351e55d3458e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
			Case	"$$HEX8$$4851e55d3458e8908095b330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX3$$4851e55d3458$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX8$$4851e55d3458e8908095b330fc30c930$$ENDHEX$$
			Case	"$$HEX6$$4851e8908095b330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX1$$4851$$ENDHEX$$"
				ldwo_my	= This.Object.$$HEX6$$4851e8908095b330fc30c930$$ENDHEX$$
				
				if ls_prog_name	= "MES_J14" then	//$$HEX10$$315c6d6942669395fb79d5521d4f687965519b52$$ENDHEX$$
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "2"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3] = "3"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[4] = "4"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[5] = "6"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[6] = "7"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[7] = "8"
				else
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
				end if
		End Choose
		
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$",ls_date, 4)	Then
			lstr_bumon.$$HEX3$$745e08670900$$ENDHEX$$= Datetime(Date(ls_date))
		End if
		
		If	pf_open_bumon2(lstr_bumon)	then				
			wf_mod_set(ll_row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
			This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$)
			
			If	ls_moji	= "$$HEX2$$e55d3458$$ENDHEX$$"	Then
				wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", String(lstr_bumon.$$HEX2$$745e0867$$ENDHEX$$), 4)
			Elseif	ls_moji	= ""	OR ls_moji	= "$$HEX1$$c24f$$ENDHEX$$" Then
				wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", 				String(lstr_bumon.$$HEX2$$745e0867$$ENDHEX$$), 	4)
				wf_mod_set(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", 	lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
				lstr_bumon2.$$HEX5$$745e0867090009000900$$ENDHEX$$= Datetime(Date(ls_date))
				lstr_bumon2.$$HEX6$$e8908095b330fc30c9300900$$ENDHEX$$= lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "1"
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]	= "3"
				pf_get_bumon2(lstr_bumon2)
				wf_mod_set(ll_row, "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$",	lstr_bumon2.$$HEX4$$e89080950d54f079$$ENDHEX$$,	1)
			End if
		End if
		
		
	/*------------------------------------------------------------------------------------
		$$HEX3$$c130fc30e030$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$","$$HEX8$$fa51ab5ec130fc30e030b330fc30c930$$ENDHEX$$","$$HEX8$$6551ab5ec130fc30e030b330fc30c930$$ENDHEX$$", "$$HEX7$$4351c130fc30e030b330fc30c930$$ENDHEX$$", "$$HEX7$$4851c130fc30e030b330fc30c930$$ENDHEX$$"
		Choose Case ls_column
			Case "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$"
				ls_moji	=	""
				ldwo_my	=	This.Object.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$
			Case "$$HEX8$$fa51ab5ec130fc30e030b330fc30c930$$ENDHEX$$"
				ls_moji	=	"$$HEX2$$fa51ab5e$$ENDHEX$$"
				ldwo_my	=	This.Object.$$HEX8$$fa51ab5ec130fc30e030b330fc30c930$$ENDHEX$$
			Case "$$HEX8$$6551ab5ec130fc30e030b330fc30c930$$ENDHEX$$"
				ls_moji	=	"$$HEX2$$6551ab5e$$ENDHEX$$"
				ldwo_my	=	This.Object.$$HEX8$$6551ab5ec130fc30e030b330fc30c930$$ENDHEX$$
			Case "$$HEX7$$4351c130fc30e030b330fc30c930$$ENDHEX$$"
				ls_moji	=	"$$HEX1$$4351$$ENDHEX$$"
				ldwo_my	=	This.Object.$$HEX7$$4351c130fc30e030b330fc30c930$$ENDHEX$$
			Case "$$HEX7$$4851c130fc30e030b330fc30c930$$ENDHEX$$"
				ls_moji	=	"$$HEX1$$4851$$ENDHEX$$"
				ldwo_my	=	This.Object.$$HEX7$$4851c130fc30e030b330fc30c930$$ENDHEX$$
		End Choose
		
		//$$HEX22$$d830c330c0306b3065519b524c3042308c30703001301d521f6724506830573066303c680d7d59308b300230$$ENDHEX$$
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
			lstr_team.$$HEX3$$745e08670900$$ENDHEX$$= Datetime(Date(ls_date))
		Else
			setNull(lstr_team.$$HEX2$$745e0867$$ENDHEX$$)
		End if
		
		If	Not wf_mod_get(ll_row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_team.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)	Then
			lstr_team.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= ""
		End if
		
		If	Not wf_mod_get(ll_row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)	Then
			wf_mod_get(ll_row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
		End if
		
		If	pf_open_Team(lstr_team)	Then
			wf_mod_set(ll_row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_team.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(ll_row, ls_moji + "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$"	, lstr_team.$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$, 1)
//			This.Trigger Event Itemchanged(ll_row, this.Object.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, lstr_team.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$)
			
			wf_mod_set(ll_row, ls_moji + "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", lstr_team.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", 			String(lstr_team.$$HEX2$$745e0867$$ENDHEX$$), 	4)
			This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_team.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$)
			
		End if
		
	/*------------------------------------------------------------------------------------
		$$HEX4$$a430d930f330c830$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX7$$a430d930f330c830b330fc30c930$$ENDHEX$$"
		ldwo_my	=	This.Object.$$HEX7$$a430d930f330c830b330fc30c930$$ENDHEX$$
		
		If	pf_open_event(lstr_event)	Then
			wf_mod_set(ll_row, "$$HEX7$$a430d930f330c830b330fc30c930$$ENDHEX$$", lstr_event.$$HEX7$$a430d930f330c830b330fc30c930$$ENDHEX$$, 1)
			This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_event.$$HEX7$$a430d930f330c830b330fc30c930$$ENDHEX$$)
		End if
	
	/*------------------------------------------------------------------------------------
		$$HEX1$$a47f$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX4$$a47fb330fc30c930$$ENDHEX$$"
		ldwo_my	=	This.Object.$$HEX4$$a47fb330fc30c930$$ENDHEX$$
		
		//$$HEX22$$d830c330c0306b3065519b524c3042308c30703001301d521f6724506830573066303c680d7d59308b300230$$ENDHEX$$
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
			lstr_gun.$$HEX3$$745e08670900$$ENDHEX$$= Datetime(Date(ls_date))
		Else
			setNull(lstr_gun.$$HEX2$$745e0867$$ENDHEX$$)
		End if		
		
		If	Not wf_mod_get(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_gun.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)	Then
			lstr_gun.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= ""
		End if
		
		If	Not wf_mod_get(ll_row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", lstr_gun.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)	Then
			If	Not wf_mod_get(ll_row, "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", lstr_gun.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)	Then
				lstr_gun.$$HEX6$$e8908095b330fc30c9300900$$ENDHEX$$= ""
			End if
		End if
		
		If	Not wf_mod_get(ll_row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", lstr_gun.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 1)	Then
			lstr_gun.$$HEX7$$c130fc30e030b330fc30c9300900$$ENDHEX$$= ""
		End if
		
		If	pf_open_Gun(lstr_gun)	Then
			wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", 				String(lstr_gun.$$HEX2$$745e0867$$ENDHEX$$),		4)
			
			wf_mod_set(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$",	lstr_gun.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 	1)
			wf_mod_set(ll_row, "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$", 		lstr_gun.$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$, 		1)

			wf_mod_set(ll_row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", 	lstr_gun.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 	1)
			wf_mod_set(ll_row, "$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$", 	lstr_gun.$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$, 	1)
			
			lstr_team.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= lstr_gun.$$HEX2$$745e0867$$ENDHEX$$
			lstr_team.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_gun.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
			lstr_team.$$HEX8$$c130fc30e030b330fc30c93009000900$$ENDHEX$$= lstr_gun.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$
			pf_get_team(lstr_team)
			
			wf_mod_set(ll_row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(ll_row, "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", 	lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
			
			lstr_bumon.$$HEX6$$745e08670900090009000900$$ENDHEX$$= lstr_gun.$$HEX2$$745e0867$$ENDHEX$$
			lstr_bumon.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_gun.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
			lstr_bumon.$$HEX7$$e8908095b330fc30c93009000900$$ENDHEX$$= lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$
			lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "1"
			lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]	= "3"
			lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3]	= "5"
			pf_get_bumon(lstr_bumon)
			wf_mod_set(ll_row, "$$HEX4$$e89080950d54f079$$ENDHEX$$", 	lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$,		1)
			wf_mod_set(ll_row, "$$HEX5$$c24fe89080950d54f079$$ENDHEX$$", lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$, 	1)
			
			wf_mod_set(ll_row, "$$HEX4$$a47fb330fc30c930$$ENDHEX$$", 	lstr_gun.$$HEX4$$a47fb330fc30c930$$ENDHEX$$, 	1)
			wf_mod_set(ll_row, "$$HEX3$$a47f0d54f079$$ENDHEX$$", 		lstr_gun.$$HEX3$$a47f0d54f079$$ENDHEX$$, 		1)
			wf_mod_set(ll_row, "$$HEX5$$0763f356f8663a530652$$ENDHEX$$", lstr_gun.$$HEX5$$0763f356f8663a530652$$ENDHEX$$, 1)
		End if
		
	/*------------------------------------------------------------------------------------
		$$HEX7$$8e96645c3a53065211ff5eff15ff$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case "$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$", "$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$", "$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$", "$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$", "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$"
		If pf_open_kaiso_hin_kubun(lstr_kaiso_h_kbn) Then
			wf_mod_set(ll_row, "$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$", lstr_kaiso_h_kbn.code1, 1)
			wf_mod_set(ll_row, "$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$", lstr_kaiso_h_kbn.code2, 1)
			wf_mod_set(ll_row, "$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$", lstr_kaiso_h_kbn.code3, 1)
			wf_mod_set(ll_row, "$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$", lstr_kaiso_h_kbn.code4, 1)
			wf_mod_set(ll_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", lstr_kaiso_h_kbn.code5, 1)
			wf_mod_set(ll_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07911ff$$ENDHEX$$", lstr_kaiso_h_kbn.name1, 1)
			wf_mod_set(ll_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07912ff$$ENDHEX$$", lstr_kaiso_h_kbn.name2, 1)
			wf_mod_set(ll_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07913ff$$ENDHEX$$", lstr_kaiso_h_kbn.name3, 1)
			wf_mod_set(ll_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07914ff$$ENDHEX$$", lstr_kaiso_h_kbn.name4, 1)
			wf_mod_set(ll_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07915ff$$ENDHEX$$", lstr_kaiso_h_kbn.name5, 1)
		End If
		
	/*------------------------------------------------------------------------------------
		$$HEX4$$4d91e68cfa57966e$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX7$$4d91e68cfa57966eb330fc30c930$$ENDHEX$$"
		ldwo_my	=	This.Object.$$HEX7$$4d91e68cfa57966eb330fc30c930$$ENDHEX$$
		
		If	pf_open_haifu(lstr_haifu)	Then
			wf_mod_set(ll_row, "$$HEX7$$4d91e68cfa57966eb330fc30c930$$ENDHEX$$", lstr_haifu.$$HEX7$$4d91e68cfa57966eb330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(ll_row, "$$HEX6$$4d91e68cfa57966e0d54f079$$ENDHEX$$", lstr_haifu.$$HEX6$$4d91e68cfa57966e0d54f079$$ENDHEX$$, 1)
//			This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_haifu.$$HEX7$$4d91e68cfa57966eb330fc30c930$$ENDHEX$$)
		End if
		
	/*------------------------------------------------------------------------------------
		$$HEX2$$bb8cee76$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$bb8cee76b330fc30c930$$ENDHEX$$"
		ldwo_my	=	This.Object.$$HEX5$$bb8cee76b330fc30c930$$ENDHEX$$
		if ls_prog_name	= "MES_Z03" then		//$$HEX6$$4c7dbb8c2f63ff6665519b52$$ENDHEX$$
			lstr_himoku.$$HEX9$$d65371621d4f68793652a15f3a5306520900$$ENDHEX$$= "1"
		end if		
		If	pf_open_himoku(lstr_himoku)	Then
			wf_mod_set(ll_row, "$$HEX5$$bb8cee76b330fc30c930$$ENDHEX$$", lstr_himoku.$$HEX5$$bb8cee76b330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(ll_row, "$$HEX4$$bb8cee760d54f079$$ENDHEX$$", lstr_himoku.$$HEX4$$bb8cee760d54f079$$ENDHEX$$, 1)
		End if
	
	/*------------------------------------------------------------------------------------
		$$HEX2$$4655c154$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$4655c154b330fc30c930$$ENDHEX$$"
		ldwo_my	=	This.Object.$$HEX5$$4655c154b330fc30c930$$ENDHEX$$
		
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
			lstr_syohin.$$HEX3$$745e08670900$$ENDHEX$$= Datetime(Date(ls_date))
		Else
			setNull(lstr_syohin.$$HEX2$$745e0867$$ENDHEX$$)
		End if
		
		If	pf_open_syohin(lstr_syohin)	Then
			wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$",			String(lstr_syohin.$$HEX2$$745e0867$$ENDHEX$$),	4)
			wf_mod_set(ll_row, "$$HEX5$$4655c154b330fc30c930$$ENDHEX$$", lstr_syohin.$$HEX5$$4655c154b330fc30c930$$ENDHEX$$, 	1)
			wf_mod_set(ll_row, "$$HEX4$$4655c1540d54f079$$ENDHEX$$", 	lstr_syohin.$$HEX4$$4655c1540d54f079$$ENDHEX$$,		1)
			
			if ls_prog_name <> "COM_M40" then	//$$HEX7$$7a6c9a5b5853a14fde30b930bf30$$ENDHEX$$
				wf_mod_set(ll_row, "$$HEX4$$c154ee766a75f753$$ENDHEX$$",	"",								1)
				wf_mod_set(ll_row, "$$HEX2$$c1540d54$$ENDHEX$$",			"",								1)
			end if
		End if
	
	/*------------------------------------------------------------------------------------
		$$HEX11$$d653155f485108ff0950ab5efb30d54e6551485109ff$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$", "$$HEX6$$d54e65514851b330fc30c930$$ENDHEX$$", "$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$", "$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$", "$$HEX6$$1659e86c4851b330fc30c930$$ENDHEX$$", "$$HEX8$$fb79d55248510950ab5eb330fc30c930$$ENDHEX$$", "$$HEX6$$0d7dc1544851b330fc30c930$$ENDHEX$$","$$HEX5$$6972416db330fc30c930$$ENDHEX$$"
		
		Choose Case	ls_column
			Case	"$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$"
				ldwo_my					= This.Object.$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$
				lstr_torihiki.$$HEX3$$0950ab5e0900$$ENDHEX$$= "1"
				ls_moji					=	""
				ls_moji2					= "$$HEX2$$0950ab5e$$ENDHEX$$"
			Case	"$$HEX6$$d54e65514851b330fc30c930$$ENDHEX$$"
				ldwo_my					= This.Object.$$HEX6$$d54e65514851b330fc30c930$$ENDHEX$$
				lstr_torihiki.$$HEX4$$d54e655148510900$$ENDHEX$$= "1"
				ls_moji					=	""
				ls_moji2					= "$$HEX3$$d54e65514851$$ENDHEX$$"
			Case	"$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$"
				ldwo_my					= This.Object.$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$
				lstr_torihiki.$$HEX3$$0950ab5e0900$$ENDHEX$$= "1"
				ls_moji					=	"$$HEX2$$fa51ab5e$$ENDHEX$$"
				ls_moji2					= "$$HEX4$$fa51ab5e0950ab5e$$ENDHEX$$"
			Case	"$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$"
				ldwo_my					= This.Object.$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$
				lstr_torihiki.$$HEX3$$0950ab5e0900$$ENDHEX$$= "1"
				ls_moji					=	"$$HEX2$$6551ab5e$$ENDHEX$$"
				ls_moji2					= "$$HEX4$$6551ab5e0950ab5e$$ENDHEX$$"
			Case	"$$HEX6$$1659e86c4851b330fc30c930$$ENDHEX$$"
				ldwo_my					= This.Object.$$HEX6$$1659e86c4851b330fc30c930$$ENDHEX$$
				lstr_torihiki.$$HEX7$$5d306e30d64e884e995011ff0900$$ENDHEX$$= "1"
				ls_moji					=	""
				ls_moji2					= "$$HEX3$$1659e86c4851$$ENDHEX$$"
			Case	"$$HEX8$$fb79d55248510950ab5eb330fc30c930$$ENDHEX$$"
				ldwo_my					= This.Object.$$HEX8$$fb79d55248510950ab5eb330fc30c930$$ENDHEX$$
				lstr_torihiki.$$HEX3$$0950ab5e0900$$ENDHEX$$= "1"
				ls_moji					=	"$$HEX3$$fb79d5524851$$ENDHEX$$"
				ls_moji2					= "$$HEX5$$fb79d55248510950ab5e$$ENDHEX$$"
			case "$$HEX6$$0d7dc1544851b330fc30c930$$ENDHEX$$"
				ldwo_my					= this.object.$$HEX6$$0d7dc1544851b330fc30c930$$ENDHEX$$
				lstr_torihiki.$$HEX4$$0d7dc15448510900$$ENDHEX$$= "1"
				ls_moji					= ""
				ls_moji2					= "$$HEX3$$0d7dc1544851$$ENDHEX$$"
			case "$$HEX5$$6972416db330fc30c930$$ENDHEX$$"	//$$HEX9$$3b200d7dc154485168300c545830e6510674$$ENDHEX$$
				ldwo_my					= this.object.$$HEX5$$6972416db330fc30c930$$ENDHEX$$
				lstr_torihiki.$$HEX4$$0d7dc15448510900$$ENDHEX$$= "1"
				ls_moji					= ""
				ls_moji2					= "$$HEX2$$6972416d$$ENDHEX$$"
		End Choose		
		If	wf_mod_get(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
			lstr_torihiki.$$HEX3$$745e08670900$$ENDHEX$$= Datetime(Date(ls_date))
		Else
			setNull(lstr_torihiki.$$HEX2$$745e0867$$ENDHEX$$)
		End if
		
		IF ls_column	= "$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$" OR	ls_column	= "$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$" OR ls_column = "$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$" THEN
				//$$HEX18$$e55d3458e89080950130e89080950130c130fc30e0306f300950ab5ea295c24f6e307f30$$ENDHEX$$
			wf_mod_get(ll_row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", 	lstr_torihiki.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$,	1)
			If	Not wf_mod_get(ll_row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$",	lstr_torihiki.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,		1)	Then
				wf_mod_get(ll_row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$",	lstr_torihiki.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,		1)
			End if
			wf_mod_get(ll_row, ls_moji + "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", lstr_torihiki.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$,	1)
		END IF
		
		If	pf_open_torihiki(lstr_torihiki)	Then
			wf_mod_set(ll_row, ls_moji2 + "$$HEX3$$b330fc30c930$$ENDHEX$$",	lstr_torihiki.$$HEX6$$d653155f4851b330fc30c930$$ENDHEX$$,	1)
			wf_mod_set(ll_row, ls_moji2 + "$$HEX2$$0d54f079$$ENDHEX$$", 	lstr_torihiki.$$HEX5$$d653155f48516575f079$$ENDHEX$$,		1)
			
			If	ls_moji2	= "$$HEX2$$0950ab5e$$ENDHEX$$"	or ls_moji2 = "$$HEX4$$fa51ab5e0950ab5e$$ENDHEX$$" or ls_moji2 = "$$HEX4$$6551ab5e0950ab5e$$ENDHEX$$" or ls_moji2 = "$$HEX3$$d54e65514851$$ENDHEX$$" or ls_moji2	= "$$HEX3$$0d7dc1544851$$ENDHEX$$" Then
				wf_mod_set(ll_row, "$$HEX2$$745e0867$$ENDHEX$$", String(lstr_torihiki.$$HEX2$$745e0867$$ENDHEX$$), 4)
				This.Trigger Event Itemchanged(ll_row, ldwo_my, lstr_torihiki.$$HEX6$$d653155f4851b330fc30c930$$ENDHEX$$)
			End if
		End if
		
		/*------------------------------------------------------------------------------------------------------------------
			$$HEX4$$d730ea30f330bf30$$ENDHEX$$
		------------------------------------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$e930d930e9306a75f753$$ENDHEX$$", "$$HEX6$$d730ea30f330bf306a75f753$$ENDHEX$$"
		choose case ls_column
			case "$$HEX5$$e930d930e9306a75f753$$ENDHEX$$"
				ldwo_my	=	This.Object.$$HEX5$$e930d930e9306a75f753$$ENDHEX$$
				ls_moji	= "$$HEX3$$e930d930e930$$ENDHEX$$"
				ls_moji2	= "1"
			case "$$HEX6$$d730ea30f330bf306a75f753$$ENDHEX$$"
				ldwo_my	= this.object.$$HEX6$$d730ea30f330bf306a75f753$$ENDHEX$$
				ls_moji	= "$$HEX4$$d730ea30f330bf30$$ENDHEX$$"
				ls_moji2	= "2"
		end choose
		If	Not wf_mod_get(ll_row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_printer.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)	Then
			lstr_printer.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= ""
		End if
		
		If	Not wf_mod_get(ll_row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", lstr_printer.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 1)	Then
			lstr_printer.$$HEX7$$c130fc30e030b330fc30c9300900$$ENDHEX$$= ""
		End if
		lstr_printer.$$HEX7$$d730ea30f330bf303a5306520900$$ENDHEX$$= ls_moji2
		
		If	pf_open_printer(lstr_printer)	Then
			wf_mod_set(ll_row, ls_moji + "$$HEX2$$6a75f753$$ENDHEX$$", lstr_printer.$$HEX6$$d730ea30f330bf306a75f753$$ENDHEX$$, 	1)
			wf_mod_set(ll_row, ls_moji + "$$HEX2$$0d54f079$$ENDHEX$$", 	lstr_printer.$$HEX6$$d730ea30f330bf300d54f079$$ENDHEX$$,		1)
		End if
	/*------------------------------------------------------------------------------------------------------------------
		$$HEX2$$e452d952$$ENDHEX$$
	------------------------------------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$e452d952b330fc30c930$$ENDHEX$$"
		
		pf_open_kinmu(lstr_kinmu)
		wf_mod_set(ll_row, "$$HEX5$$e452d952b330fc30c930$$ENDHEX$$", lstr_kinmu.$$HEX5$$e452d952b330fc30c930$$ENDHEX$$, 	1)	
		wf_mod_set(ll_row, "$$HEX4$$e452d9520d54f079$$ENDHEX$$", 	lstr_kinmu.$$HEX4$$e452d9520d54f079$$ENDHEX$$, 	1)	
		
	/*------------------------------------------------------------------------------------------------------------------
		$$HEX6$$41ff06525e98b330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------------------------------------*/
	Case	"$$HEX6$$41ff06525e98b330fc30c930$$ENDHEX$$"
		
		pf_open_a_bunrui(lstr_a_bunrui)
		wf_mod_set(ll_row, "$$HEX6$$41ff06525e98b330fc30c930$$ENDHEX$$"	, lstr_a_bunrui.$$HEX6$$41ff06525e98b330fc30c930$$ENDHEX$$, 1)	
		wf_mod_set(ll_row, "$$HEX5$$41ff06525e980d54f079$$ENDHEX$$"		, lstr_a_bunrui.$$HEX5$$41ff06525e980d54f079$$ENDHEX$$, 	1)	
End Choose

end event

event zero_pack(long row, dwobject dwo, string data);/*---------------------------------------------------------------------------
$$HEX4$$0d540030f0790900$$ENDHEX$$ZERO_PACK

$$HEX21$$ac8a00300e660900e65d7eff9eff9bff708a92304c88463095ff70ff7bff9eff72ff8dff9eff9dff84ff$$ENDHEX$$(ItemChanged$$HEX12$$72ff8dff9eff9dff84ff88308a30778dd55255308c308b30$$ENDHEX$$)
			$$HEX3$$464f57300130$$ENDHEX$$ItemChanged$$HEX17$$778dd5528c5f6b300130535f72ff8dff9eff9dff84ff4c30778dd55255308c308b30$$ENDHEX$$

$$HEX4$$155f003070650900$$ENDHEX$$Long		row	:$$HEX8$$0959f46655308c305f304c886a75f753$$ENDHEX$$
			dwobject	dwo	:$$HEX10$$0959f46655308c305f3076ff97ff91ffc5603158$$ENDHEX$$
			String	data	:$$HEX9$$0959f46655308c305f30b065573044302450$$ENDHEX$$

$$HEX6$$3b620030245009006a305730$$ENDHEX$$

$$HEX4$$5c4f1062e5650900$$ENDHEX$$2000.11.16	Jupiter	T.Ohno

$$HEX4$$f466b065e5650900$$ENDHEX$$2005.05.20				tada		PB$$HEX14$$d0639b4f6e30a295706592307f4f287559308b3088304630ee4f636b$$ENDHEX$$
			
---------------------------------------------------------------------------*/

Long		ll_column_len
String	ls_buf

If auto_zero_pack Then
	If Upper(Left(dwo.coltype, 4)) <> "CHAR" Then
		//$$HEX17$$7eff9eff9bff708a92304c884a30463068305730663044308b3076ff97ff91ff4c30$$ENDHEX$$CHAR$$HEX13$$8b5767306a3044306e306730e65106749230375f3652427d864e$$ENDHEX$$
		This.SetRedraw(True)
		Return
	End if

	//$$HEX10$$76ff97ff91ff6e308765575b70656e30d653975f$$ENDHEX$$
	ll_column_len	= get_column_len(dwo)
	
	//$$HEX9$$e65d92307eff9eff9bff708a6b3059308b30$$ENDHEX$$
	ls_buf	= pf_zero_pack(data, ll_column_len)
	This.SetItem(row, dwo.name, ls_buf)

	This.SetItem(row, dwo.name, data)	// 2005.08.31 UPD $$HEX22$$bc30ed30d130c330af30e6510674fe5bdc5f6e305f308130c730fc30bf306e30216e5730b96592300959f466$$ENDHEX$$
End if

This.SetRedraw(True)
end event

public function long get_column_len (dwobject a_dwo);//-----------------------------------------------------------------------
//$$HEX4$$0d540030f0790900$$ENDHEX$$get_column_len
//
//$$HEX22$$ac8a00300e66090076ff97ff91ffc560315888308a3076ff97ff91ff6e30416870659230d653975f59308b30$$ENDHEX$$
//
//$$HEX4$$155f003070650900$$ENDHEX$$DwObject	a_dwo	:$$HEX18$$83ff9eff70ff80ff73ff68ff9dff84ff9eff73ff75ff8cff9eff7cff9eff6aff78ff84ff$$ENDHEX$$
//
//$$HEX4$$3b62003024500900$$ENDHEX$$Long				:$$HEX2$$41687065$$ENDHEX$$
//
//$$HEX4$$5c4f1062e5650900$$ENDHEX$$2000.11.16	Jupiter	T.Ohno
//-----------------------------------------------------------------------

/*
//-----------------------------------------------------------------------
//$$HEX12$$83ff70ff8cff9eff99ff88308a30416870656e30d653975f$$ENDHEX$$
//-----------------------------------------------------------------------
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

$$HEX33$$ac8a00300e6609000967b9526a30ab30e930e0304b30693046304b3092302452ad6557300130095970656e308b576b30423063305f30bb30c330c83092304c884630$$ENDHEX$$

$$HEX4$$155f003070650900$$ENDHEX$$Long		al_row				$$HEX1$$4c88$$ENDHEX$$
			String	as_column_name		$$HEX4$$ab30e930e0300d54$$ENDHEX$$
			String	as_data				$$HEX3$$c730fc30bf30$$ENDHEX$$
			Int		ai_mode				$$HEX5$$c730fc30bf306e308b57$$ENDHEX$$
				1:String 2:Dec 3:Date 4:DateTime

$$HEX4$$3b62003024500900$$ENDHEX$$Boolean
				true:$$HEX3$$10629f520900$$ENDHEX$$false:$$HEX2$$31595765$$ENDHEX$$

$$HEX4$$5c4f1062e5650900$$ENDHEX$$2004.01.10	Jupiter	Aki
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

$$HEX33$$ac8a00300e6609000967b9526a30ab30e930e0304b30693046304b3092302452ad6557300130095970656e308b576b30423063305f30bb30c330c83092304c884630$$ENDHEX$$

$$HEX4$$155f003070650900$$ENDHEX$$Long		al_row				$$HEX1$$4c88$$ENDHEX$$
			String	as_column_name		$$HEX4$$ab30e930e0300d54$$ENDHEX$$
			String	as_data				$$HEX3$$c730fc30bf30$$ENDHEX$$(REF)
			Int		ai_mode				$$HEX5$$c730fc30bf306e308b57$$ENDHEX$$
				1:String 2:Dec 3:Date 4:DateTime

$$HEX4$$3b62003024500900$$ENDHEX$$Boolean
				true:$$HEX3$$10629f520900$$ENDHEX$$false:$$HEX2$$31595765$$ENDHEX$$

$$HEX4$$5c4f1062e5650900$$ENDHEX$$2004.01.10	Jupiter	Aki
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

$$HEX33$$ac8a00300e6609000967b9526a30ab30e930e0304b30693046304b3092302452ad6557300130095970656e308b576b30423063305f30bb30c330c83092304c884630$$ENDHEX$$

$$HEX4$$155f003070650900$$ENDHEX$$String	as_column_name		$$HEX4$$ab30e930e0300d54$$ENDHEX$$
			
$$HEX4$$3b62003024500900$$ENDHEX$$Boolean
				true:$$HEX3$$10629f520900$$ENDHEX$$false:$$HEX2$$31595765$$ENDHEX$$

$$HEX4$$5c4f1062e5650900$$ENDHEX$$2004.04.02	Jupiter	Aki
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

public function integer wf_mod_chk (long al_row, string as_column_name, integer ai_mode);/*--------------------------------------------------------------
$$HEX4$$0d540030f0790900$$ENDHEX$$wf_mod_chk

$$HEX30$$ac8a00300e6609000967b9526a30ab30e930e0304b30693046304b3092302452ad655730013065519b5224504c30585b285759308b304b3024529a5b$$ENDHEX$$

$$HEX4$$155f003070650900$$ENDHEX$$Long		al_row				$$HEX1$$4c88$$ENDHEX$$
			String	as_column_name		$$HEX4$$ab30e930e0300d54$$ENDHEX$$
			Int		ai_mode				$$HEX5$$c730fc30bf306e308b57$$ENDHEX$$
				1:String 2:Dec 3:Date 4:DateTime

$$HEX4$$3b62003024500900$$ENDHEX$$integer
				-1:$$HEX6$$ab30e930e0306a3057300900$$ENDHEX$$0:$$HEX6$$65519b5224506a3057300900$$ENDHEX$$1:$$HEX5$$65519b52245042308a30$$ENDHEX$$

$$HEX4$$5c4f1062e5650900$$ENDHEX$$2007.05.31	Tosco	Hayashi
--------------------------------------------------------------*/

String		ls_ret

If	Not wf_mod_get(al_row, as_column_name, ls_ret, ai_mode)	Then
	return -1
End if

If pf_nvl_String(ls_ret, "")	= ""	Then
	return 0
End if

return 1
end function

public subroutine wf_ ();
end subroutine

public subroutine wf_date_change ();
end subroutine

public subroutine wf_date_change (long al_row, string as_data, string as_column, string as_prog_name);/*___/___/___/___/___/___/____/___/___/___/___/___/___/____/___/___/___/___/___/___/____/

	$$HEX17$$ac8a0e660900745e08670959f46642666e30de30b930bf308d511c69227de6510674$$ENDHEX$$
		
	$$HEX3$$fe5bdc5f086e$$ENDHEX$$
		
		$$HEX5$$e8908095de30b930bf30$$ENDHEX$$
			$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$,$$HEX9$$fa51ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$,$$HEX9$$6551ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$
			
			$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$,$$HEX8$$2f63ff664851e8908095b330fc30c930$$ENDHEX$$,$$HEX7$$f8764b62e8908095b330fc30c930$$ENDHEX$$
			
		$$HEX6$$c130fc30e030de30b930bf30$$ENDHEX$$
			$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, $$HEX8$$fa51ab5ec130fc30e030b330fc30c930$$ENDHEX$$, $$HEX8$$6551ab5ec130fc30e030b330fc30c930$$ENDHEX$$
			
		$$HEX6$$e930a430f330de30b930bf30$$ENDHEX$$
			$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$,$$HEX8$$f8764b62e930a430f330b330fc30c930$$ENDHEX$$,$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$
			
		$$HEX5$$e55d0b7ade30b930bf30$$ENDHEX$$
			$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$,$$HEX6$$4d52e55d0b7ab330fc30c930$$ENDHEX$$
			
		$$HEX4$$a47fde30b930bf30$$ENDHEX$$
			$$HEX4$$a47fb330fc30c930$$ENDHEX$$
		
		$$HEX6$$d653155f4851b330fc30c930$$ENDHEX$$
			$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$,$$HEX6$$d54e65514851b330fc30c930$$ENDHEX$$,$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$,$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$,$$HEX6$$1659e86c4851b330fc30c930$$ENDHEX$$,$$HEX8$$fb79d55248510950ab5eb330fc30c930$$ENDHEX$$
			
		$$HEX5$$4655c154de30b930bf30$$ENDHEX$$
			$$HEX5$$4655c154b330fc30c930$$ENDHEX$$
			
		$$HEX5$$c154ee76de30b930bf30$$ENDHEX$$
			$$HEX4$$c154ee766a75f753$$ENDHEX$$,$$HEX7$$2f63ff664d52c154ee766a75f753$$ENDHEX$$,$$HEX7$$2f63ff668c5fc154ee766a75f753$$ENDHEX$$,$$HEX6$$2375fa51c154ee766a75f753$$ENDHEX$$,$$HEX6$$95626551c154ee766a75f753$$ENDHEX$$,$$HEX6$$fe5bd46bc154ee766a75f753$$ENDHEX$$
	
___/___/___/___/___/___/____/___/___/___/___/___/___/____/___/___/___/___/___/___/____/ */
string			ls_date,		ls_moji
datetime			ldt_date
int				i
ps_hin			lstr_hin
ps_tani			lstr_tani

ps_prog			lstr_prog

ps_hinkubun		lstr_hinkubun
ps_bumon			lstr_bumon,		lstr_bumon_null
ps_bumon			lstr_bumon2, 	lstr_bumon2_null
ps_tkubun		lstr_tkubun

ps_kamoku		lstr_kamoku

ps_koutei		lstr_koutei, lstr_koutei_reset
ps_line			lstr_line, lstr_line_reset
ps_togo_line	lstr_togo_line, lstr_togo_line_reset

ps_team			lstr_team, lstr_team_reset
ps_event			lstr_event
ps_gun			lstr_gun,	lstr_gun_reset
ps_kaiso_hin_kubun		lstr_kaiso_h_kbn
ps_haifu			lstr_haifu
ps_himoku		lstr_himoku
ps_tanto			lstr_tanto

ps_torihiki		lstr_torihiki, lstr_tori_reset
ps_syohin		lstr_syohin


If	wf_mod_get(al_row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
	ldt_date	= Datetime(Date(ls_date))
	If	as_column	= "$$HEX2$$745e0867$$ENDHEX$$"	Then
		ldt_date	= Datetime(Date(as_data))
	End if
	
	//$$HEX6$$e55d3458e89080951c69227d$$ENDHEX$$
	
	For i = 1 to 11	//$$HEX7$$0067275924506f3001308765575b$$ENDHEX$$(ls_moji)$$HEX5$$6b3088308a307a6c9a5b$$ENDHEX$$
		
		lstr_bumon	=	lstr_bumon_null
		lstr_bumon2	=	lstr_bumon2_null
		
		Choose Case i
			Case	1
				ls_moji	=	""
				
				//$$HEX5$$e8908095de30b930bf30$$ENDHEX$$.$$HEX16$$aa89e8908095b330fc30c9306e30345808540130e89080953a5306525e7d8a30$$ENDHEX$$
				If	as_prog_name = "COM_M11"	Then
					wf_mod_get(al_row, "$$HEX4$$e89080953a530652$$ENDHEX$$", lstr_bumon.$$HEX4$$e89080953a530652$$ENDHEX$$, 1)
					Choose Case	lstr_bumon.$$HEX4$$e89080953a530652$$ENDHEX$$
						Case	"2"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "1"
						Case	"4", "5"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "3"
						Case	"7"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "6"
						Case	Else
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
					End Choose
				Else
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
				End If
				
			Case	2
				ls_moji	=	"$$HEX2$$fa51ab5e$$ENDHEX$$"
			Case	3
				ls_moji	=	"$$HEX2$$6551ab5e$$ENDHEX$$"
			Case	4
				ls_moji	=	"$$HEX2$$f8764b62$$ENDHEX$$"
			Case	5
				ls_moji	=	"$$HEX3$$2f63ff664851$$ENDHEX$$"
			Case	6
				ls_moji	=	"$$HEX3$$2f63ff664d52$$ENDHEX$$"
			Case	7
				ls_moji	=	"$$HEX3$$2f63ff668c5f$$ENDHEX$$"
			Case	8
				ls_moji	=	"$$HEX2$$2375fa51$$ENDHEX$$"
			Case	9
				ls_moji	=	"$$HEX2$$95626551$$ENDHEX$$"
			Case	10
				ls_moji	=	"$$HEX2$$fe5bd46b$$ENDHEX$$"
			Case	11
				ls_moji	=	"$$HEX3$$fb79d5524851$$ENDHEX$$"
		End Choose
		
		
		wf_mod_get(al_row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
		lstr_bumon.$$HEX3$$745e08670900$$ENDHEX$$= ldt_date
		if as_prog_name = "COM_M11" then
			lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "1"
			lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]	= "3"
		end if
		pf_get_bumon2(lstr_bumon)
		wf_mod_set(al_row, ls_moji + "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$", lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$, 1)
	
		//$$HEX4$$c24fe890809508ff$$ENDHEX$$or $$HEX5$$e890809509ff1c69227d$$ENDHEX$$
		lstr_bumon2.$$HEX3$$745e08670900$$ENDHEX$$= ldt_date
		
		if	Not wf_mod_get(al_row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", lstr_bumon2.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)	Then
			wf_mod_get(al_row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", lstr_bumon2.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
		End if
		
		Choose Case as_prog_name
			Case "COM_G06"	//$$HEX9$$9f53a14f196a966e3fffc38c877365519b52$$ENDHEX$$
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "1"
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]	= "2"
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3]	= "3"
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[4]	= "4"
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[5]	= "5"
			Case Else
				if ls_moji <> "$$HEX2$$f8764b62$$ENDHEX$$" or ls_moji = "$$HEX3$$2f63ff664851$$ENDHEX$$" then
					lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "1"
					lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]	= "3"
					lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3]	= "5"
				end if
		End Choose

		pf_get_bumon2(lstr_bumon2)
		wf_mod_set(al_row, ls_moji + "$$HEX5$$c24fe89080950d54f079$$ENDHEX$$", lstr_bumon2.$$HEX4$$e89080950d54f079$$ENDHEX$$, 1)
		wf_mod_set(al_row, ls_moji + "$$HEX4$$e89080950d54f079$$ENDHEX$$", lstr_bumon2.$$HEX4$$e89080950d54f079$$ENDHEX$$, 1)
		
		
		//$$HEX5$$c130fc30e0301c69227d$$ENDHEX$$
		lstr_team	=	lstr_team_reset
		wf_mod_get(al_row, ls_moji + "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", lstr_team.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 1)
		lstr_team.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= lstr_bumon.$$HEX2$$745e0867$$ENDHEX$$
		lstr_team.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$
		pf_get_team(lstr_team)
		wf_mod_set(al_row, ls_moji + "$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$", lstr_team.$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$, 1)
			
		//$$HEX5$$e930a430f3301c69227d$$ENDHEX$$
		lstr_line	=	lstr_line_reset
		wf_mod_get(al_row, ls_moji + "$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$", lstr_line.$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$, 1)	
		lstr_line.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= lstr_bumon.$$HEX3$$745e08670900$$ENDHEX$$
		lstr_line.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
		pf_get_line(lstr_line)
		wf_mod_set(al_row, ls_moji + "$$HEX5$$e930a430f3300d54f079$$ENDHEX$$", lstr_line.$$HEX5$$e930a430f3300d54f079$$ENDHEX$$, 1)
		
		//$$HEX7$$717d0854e930a430f3301c69227d$$ENDHEX$$
		lstr_togo_line	=	lstr_togo_line_reset
		wf_mod_get(al_row, "$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$", lstr_togo_line.$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$, 1)	
		lstr_togo_line.$$HEX6$$745e08670900090009000900$$ENDHEX$$= lstr_bumon.$$HEX3$$745e08670900$$ENDHEX$$
		lstr_togo_line.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
		pf_get_togo_line(lstr_togo_line)
		wf_mod_set(al_row, "$$HEX7$$717d0854e930a430f3300d54f079$$ENDHEX$$", lstr_togo_line.$$HEX7$$717d0854e930a430f3300d54f079$$ENDHEX$$, 1)
		
		//$$HEX4$$e55d0b7a1c69227d$$ENDHEX$$
		lstr_koutei	=	lstr_koutei_reset
		wf_mod_get(al_row, ls_moji + "$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$", lstr_koutei.$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$, 1)	
		lstr_koutei.$$HEX6$$745e08670900090009000900$$ENDHEX$$= lstr_bumon.$$HEX3$$745e08670900$$ENDHEX$$
		lstr_koutei.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
		lstr_koutei.$$HEX7$$c130fc30e030b330fc30c9300900$$ENDHEX$$= lstr_team.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$
		lstr_koutei.$$HEX7$$e930a430f330b330fc30c9300900$$ENDHEX$$= lstr_line.$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$
		pf_get_koutei(lstr_koutei)
		wf_mod_set(al_row, ls_moji + "$$HEX4$$e55d0b7a0d54f079$$ENDHEX$$", lstr_koutei.$$HEX4$$e55d0b7a0d54f079$$ENDHEX$$, 1)
		
		//$$HEX3$$a47f1c69227d$$ENDHEX$$
		lstr_gun	=	lstr_gun_reset
		wf_mod_get(al_row, ls_moji + "$$HEX4$$a47fb330fc30c930$$ENDHEX$$", lstr_gun.$$HEX4$$a47fb330fc30c930$$ENDHEX$$, 1)	
		lstr_gun.$$HEX6$$745e08670900090009000900$$ENDHEX$$= lstr_bumon.$$HEX3$$745e08670900$$ENDHEX$$
		lstr_gun.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
		lstr_gun.$$HEX7$$c130fc30e030b330fc30c9300900$$ENDHEX$$= lstr_team.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$
		pf_get_gun(lstr_gun)
		wf_mod_set(al_row, ls_moji + "$$HEX3$$a47f0d54f079$$ENDHEX$$", lstr_gun.$$HEX3$$a47f0d54f079$$ENDHEX$$, 1)

		//$$HEX4$$0950ab5e1c69227d$$ENDHEX$$
		wf_mod_get(al_row, ls_moji + "$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$", lstr_torihiki.$$HEX6$$d653155f4851b330fc30c930$$ENDHEX$$, 1)
		lstr_torihiki.$$HEX4$$745e086709000900$$ENDHEX$$= ldt_date
		lstr_torihiki.$$HEX4$$0950ab5e09000900$$ENDHEX$$= "1"
		pf_get_torihiki(lstr_torihiki)
		wf_mod_set(al_row, ls_moji + "$$HEX4$$0950ab5e0d54f079$$ENDHEX$$",	lstr_torihiki.$$HEX5$$d653155f48516575f079$$ENDHEX$$,	1)
		
		lstr_torihiki	=	lstr_tori_reset
		
		//$$HEX5$$d54e655148511c69227d$$ENDHEX$$
		wf_mod_get(al_row, ls_moji + "$$HEX6$$d54e65514851b330fc30c930$$ENDHEX$$", lstr_torihiki.$$HEX6$$d653155f4851b330fc30c930$$ENDHEX$$, 1)
		lstr_torihiki.$$HEX4$$745e086709000900$$ENDHEX$$= ldt_date
		lstr_torihiki.$$HEX5$$d54e6551485109000900$$ENDHEX$$= "1"
		pf_get_torihiki(lstr_torihiki)
		wf_mod_set(al_row, ls_moji + "$$HEX5$$d54e655148510d54f079$$ENDHEX$$",	lstr_torihiki.$$HEX5$$d653155f48516575f079$$ENDHEX$$,	1)
		
		//$$HEX4$$4655c1541c69227d$$ENDHEX$$
		lstr_syohin.$$HEX5$$745e0867090009000900$$ENDHEX$$= ldt_date
		wf_mod_get(al_row, ls_moji + "$$HEX5$$4655c154b330fc30c930$$ENDHEX$$", lstr_syohin.$$HEX5$$4655c154b330fc30c930$$ENDHEX$$, 1)
		pf_get_syohin(lstr_syohin)
		wf_mod_set(al_row, ls_moji + "$$HEX4$$4655c1540d54f079$$ENDHEX$$",	lstr_syohin.$$HEX4$$4655c1540d54f079$$ENDHEX$$,	1)
		
		//$$HEX4$$c1540d541c69227d$$ENDHEX$$
		lstr_hin.$$HEX6$$745e08670900090009000900$$ENDHEX$$= ldt_date
		wf_mod_get(al_row, ls_moji + "$$HEX4$$c154ee766a75f753$$ENDHEX$$", lstr_hin.$$HEX4$$c154ee766a75f753$$ENDHEX$$, 1)
		pf_get_hin(lstr_hin)
		wf_mod_set(al_row, ls_moji + "$$HEX2$$c1540d54$$ENDHEX$$",	lstr_hin.$$HEX2$$c1540d54$$ENDHEX$$,	1)

	Next
	
End if
end subroutine

public subroutine wf_itemchanged_kaiso (string as_dwo_name, string as_data, long al_row, string as_prog_name);/*--------------------------------------------------------------
$$HEX4$$0d540030f0790900$$ENDHEX$$wf_itemchanged_kaiso

$$HEX14$$ac8a00300e6609008e96645cc1540d543a53065211ff5eff15ff6e30$$ENDHEX$$itemchanged$$HEX2$$e6510674$$ENDHEX$$

$$HEX4$$155f003070650900$$ENDHEX$$String	as_dwo_name			$$HEX4$$ab30e930e0300d54$$ENDHEX$$
			String	as_data				$$HEX3$$c730fc30bf30$$ENDHEX$$
			Long		al_row				$$HEX1$$4c88$$ENDHEX$$
			String	as_prog_name		$$HEX6$$d730ed30b030e930e0300d54$$ENDHEX$$

$$HEX4$$3b62003024500900$$ENDHEX$$(None)

$$HEX4$$5c4f1062e5650900$$ENDHEX$$2007.11.15	Jupiter
--------------------------------------------------------------*/
ps_kaiso_hin_kubun	lstr_kaiso_h_kbn


Choose Case	as_dwo_name
	Case	"$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$"
		lstr_kaiso_h_kbn.code1 = as_data
		lstr_kaiso_h_kbn.code2 = "000"
		lstr_kaiso_h_kbn.code3 = "000"
		lstr_kaiso_h_kbn.code4 = "000"
		lstr_kaiso_h_kbn.code5 = "000"
		pf_get_kaiso_hin_kubun(lstr_kaiso_h_kbn)

		wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$", lstr_kaiso_h_kbn.code1, 1)
		Choose Case as_prog_name 
			Case "COM_M07"		// $$HEX9$$8e96645cc1540d543a530652de30b930bf30$$ENDHEX$$
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$", lstr_kaiso_h_kbn.code2, 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$", lstr_kaiso_h_kbn.code3, 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$", lstr_kaiso_h_kbn.code4, 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", lstr_kaiso_h_kbn.code5, 1)
			Case Else
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$", "", 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$", "", 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$", "", 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", "", 1)
		End Choose
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07911ff$$ENDHEX$$", lstr_kaiso_h_kbn.name1, 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07912ff$$ENDHEX$$", "", 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07913ff$$ENDHEX$$", "", 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07914ff$$ENDHEX$$", "", 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07915ff$$ENDHEX$$", "", 1)
	Case	"$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$"
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code1,	1)
		lstr_kaiso_h_kbn.code2 = as_data
		lstr_kaiso_h_kbn.code3 = "000"
		lstr_kaiso_h_kbn.code4 = "000"
		lstr_kaiso_h_kbn.code5 = "000"

		pf_get_kaiso_hin_kubun(lstr_kaiso_h_kbn)

		wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$", lstr_kaiso_h_kbn.code2, 1)
		Choose Case as_prog_name 
			Case "COM_M07"		// $$HEX9$$8e96645cc1540d543a530652de30b930bf30$$ENDHEX$$
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$", lstr_kaiso_h_kbn.code3, 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$", lstr_kaiso_h_kbn.code4, 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", lstr_kaiso_h_kbn.code5, 1)
			Case Else
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$", "", 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$", "", 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", "", 1)
		End Choose
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07912ff$$ENDHEX$$", lstr_kaiso_h_kbn.name2, 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07913ff$$ENDHEX$$", "", 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07914ff$$ENDHEX$$", "", 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07915ff$$ENDHEX$$", "", 1)
	Case	"$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$"
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code1,	1)
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code2,	1)
		lstr_kaiso_h_kbn.code3 = as_data
		lstr_kaiso_h_kbn.code4 = "000"
		lstr_kaiso_h_kbn.code5 = "000"
		pf_get_kaiso_hin_kubun(lstr_kaiso_h_kbn)

		wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$", lstr_kaiso_h_kbn.code3, 1)
		Choose Case as_prog_name 
			Case "COM_M07"		// $$HEX9$$8e96645cc1540d543a530652de30b930bf30$$ENDHEX$$
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$", lstr_kaiso_h_kbn.code4, 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", lstr_kaiso_h_kbn.code5, 1)
			Case Else
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$", "", 1)
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", "", 1)
		End Choose
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07913ff$$ENDHEX$$", lstr_kaiso_h_kbn.name3, 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07914ff$$ENDHEX$$", "", 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07915ff$$ENDHEX$$", "", 1)
	Case	"$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$"
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code1,	1)
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code2,	1)
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code3,	1)
		lstr_kaiso_h_kbn.code4 = as_data
		lstr_kaiso_h_kbn.code5 = "000"
		pf_get_kaiso_hin_kubun(lstr_kaiso_h_kbn)

		wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$", lstr_kaiso_h_kbn.code4, 1)
		Choose Case as_prog_name 
			Case "COM_M07"		// $$HEX9$$8e96645cc1540d543a530652de30b930bf30$$ENDHEX$$
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", lstr_kaiso_h_kbn.code5, 1)
			Case Else
				wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", "", 1)
		End Choose
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07914ff$$ENDHEX$$", lstr_kaiso_h_kbn.name4, 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07915ff$$ENDHEX$$", "", 1)
	Case	"$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$"
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code1,	1)
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code2,	1)
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code3,	1)
		wf_mod_get(al_row,	"$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$",	lstr_kaiso_h_kbn.code4,	1)
		lstr_kaiso_h_kbn.code5 = as_data
		pf_get_kaiso_hin_kubun(lstr_kaiso_h_kbn)

		wf_mod_set(al_row, "$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$", lstr_kaiso_h_kbn.code5, 1)
		wf_mod_set(al_row, "$$HEX9$$8e96645cc1540d543a5306520d54f07915ff$$ENDHEX$$", lstr_kaiso_h_kbn.name5, 1)
End Choose
		
end subroutine

public subroutine wf_itemchanged_hinkubun (string as_dwo_name, string as_data, long al_row, string as_prog_name);/*--------------------------------------------------------------
$$HEX4$$0d540030f0790900$$ENDHEX$$wf_itemchanged_hinkubun

$$HEX13$$ac8a00300e660900c1540d543a53065211ff5eff12ff10ff6e30$$ENDHEX$$itemchanged$$HEX2$$e6510674$$ENDHEX$$

$$HEX4$$155f003070650900$$ENDHEX$$String	as_dwo_name			$$HEX4$$ab30e930e0300d54$$ENDHEX$$
			String	as_data				$$HEX3$$c730fc30bf30$$ENDHEX$$
			Long		al_row				$$HEX1$$4c88$$ENDHEX$$
			String	as_prog_name		$$HEX6$$d730ed30b030e930e0300d54$$ENDHEX$$

$$HEX4$$3b62003024500900$$ENDHEX$$(None)

$$HEX4$$5c4f1062e5650900$$ENDHEX$$2007.11.15	Jupiter
--------------------------------------------------------------*/

string			ls_moji
ps_hinkubun		lstr_hinkubun

Choose Case as_dwo_name
	Case	"$$HEX5$$c1540d543a53065211ff$$ENDHEX$$"
		ls_moji 			= "01"
	Case	"$$HEX5$$c1540d543a53065212ff$$ENDHEX$$"
		ls_moji 			= "02"
	Case	"$$HEX5$$c1540d543a53065213ff$$ENDHEX$$"
		ls_moji 			= "03"
	Case	"$$HEX5$$c1540d543a53065214ff$$ENDHEX$$"
		ls_moji 			= "04"
	Case	"$$HEX5$$c1540d543a53065215ff$$ENDHEX$$"
		ls_moji 			= "05"
	Case	"$$HEX5$$c1540d543a53065216ff$$ENDHEX$$"
		ls_moji 			= "06"
	Case	"$$HEX5$$c1540d543a53065217ff$$ENDHEX$$"
		ls_moji 			= "07"
	Case	"$$HEX5$$c1540d543a53065218ff$$ENDHEX$$"
		ls_moji 			= "08"
	Case	"$$HEX5$$c1540d543a53065219ff$$ENDHEX$$"
		ls_moji 			= "09"
	Case	"$$HEX6$$c1540d543a53065211ff10ff$$ENDHEX$$"
		ls_moji 			= "10"
	Case	"$$HEX6$$c1540d543a53065211ff11ff$$ENDHEX$$"
		ls_moji 			= "11"
	Case	"$$HEX6$$c1540d543a53065211ff12ff$$ENDHEX$$"
		ls_moji 			= "12"
	Case	"$$HEX6$$c1540d543a53065211ff13ff$$ENDHEX$$"
		ls_moji 			= "13"
	Case	"$$HEX6$$c1540d543a53065211ff14ff$$ENDHEX$$"
		ls_moji 			= "14"
	Case	"$$HEX6$$c1540d543a53065211ff15ff$$ENDHEX$$"
		ls_moji 			= "15"
	Case	"$$HEX6$$c1540d543a53065211ff16ff$$ENDHEX$$"
		ls_moji 			= "16"
	Case	"$$HEX6$$c1540d543a53065211ff17ff$$ENDHEX$$"
		ls_moji 			= "17"
	Case	"$$HEX6$$c1540d543a53065211ff18ff$$ENDHEX$$"
		ls_moji 			= "18"
	Case	"$$HEX6$$c1540d543a53065211ff19ff$$ENDHEX$$"
		ls_moji 			= "19"
	Case	"$$HEX6$$c1540d543a53065212ff10ff$$ENDHEX$$"
		ls_moji 			= "20"
End Choose

lstr_hinkubun.$$HEX5$$c1540d543a5306522000$$ENDHEX$$= ls_moji

lstr_hinkubun.$$HEX8$$c1540d543a530652b330fc30c9302000$$ENDHEX$$= pf_nvl_string(as_data, "")

If lstr_hinkubun.$$HEX8$$c1540d543a530652b330fc30c9302000$$ENDHEX$$= "00" Then
	wf_mod_set(al_row, "$$HEX6$$c1540d543a5306520d54f079$$ENDHEX$$" + pf_to_multi_byte(string(long(ls_moji))), "", 1)
Else
	pf_get_hinkubun(lstr_hinkubun)
	wf_mod_set(al_row, "$$HEX4$$c1540d543a530652$$ENDHEX$$" + pf_to_multi_byte(string(long(ls_moji))), lstr_hinkubun.$$HEX7$$c1540d543a530652b330fc30c930$$ENDHEX$$, 1)
	wf_mod_set(al_row, "$$HEX6$$c1540d543a5306520d54f079$$ENDHEX$$" + pf_to_multi_byte(string(long(ls_moji))), lstr_hinkubun.$$HEX6$$c1540d543a5306520d54f079$$ENDHEX$$, 1)
End If
end subroutine

event rowfocuschanged;If auto_selectrow Then
	If currentrow > 0 Then
		This.Modify("	DataWindow.Detail.Color	=	'0~tIf(currentrow() = getrow(), RGB(255,192,192), RGB(255,255,255))'")
	End If
End If

end event

event retrieveend;
If auto_selectrow Then
	If rowcount > 0 Then
		This.SetRow(1)
		This.Modify("	DataWindow.Detail.Color	=	'0~tIf(currentrow() = getrow(), RGB(255,192,192), RGB(255,255,255))'")
	End If
End If

end event

event losefocus;This.AcceptText()

end event

event clicked;String	ls_prog_name

If row > 0 Then
	This.SetRow(row)
//$$HEX4$$1c690e8a2d4e0900$$ENDHEX$$
//	ls_prog_name	= Upper(pf_nvl_string(gstr_kaisya.prog_name, ""))
//	If	ls_prog_name	<> "COM_M37"	Then	//	COM_M37:$$HEX9$$4d91e68cfa57966e2450de30b930bf300030$$ENDHEX$$setRow*2$$HEX14$$60306830a830e930fc304c30fa518b305f308130ab669a5bfe5bdc5f$$ENDHEX$$
//		//PB10$$HEX3$$0d4e77510854$$ENDHEX$$
//		//setRow()$$HEX33$$67304c88fb79d55257305f3034580854013078909e624c886e30fe734c88ab30e930e0306b30d730ed30c630af30c8304c304b304b306330663044305f3034580854$$ENDHEX$$
//		//$$HEX3$$78909e624c88$$ENDHEX$$+1$$HEX13$$6e304c886b30d530a930fc30ab30b9304c3042305f308b300230$$ENDHEX$$
//		//setRow()$$HEX26$$92308c4ede56188af08f59308b30533068306730ab669a5bfe5bdc5f0230aa30d530a330b730e330eb30fe5bdc5f855f61300230$$ENDHEX$$
//		This.SetRow(row)
//	End if
	
End If

end event

event itemchanged;/*___/___/___/___/___/___/____/___/___/___/___/___/___/____/___/___/___/___/___/___/____/

$$HEX13$$ac8a0e660900997d7f626b30663071511a90ab30e930e0306e30$$ENDHEX$$itemchanged$$HEX6$$e651067492304c8846300230$$ENDHEX$$
		
		1.com_pw.pbl$$HEX4$$6830bb30c330c830$$ENDHEX$$
		
		2.$$HEX20$$ab30e930e0306e30585b2857c130a730c330af308c5f6b30e65106749230188af08f59308b300230$$ENDHEX$$(wf_mod_set$$HEX2$$6b306630$$ENDHEX$$)
			
		3.$$HEX36$$d730ed30b030e930e030fa5609676e30ab30e930e0306e30345808540c30d730ed30b030e930e03029ff24ff0d309230b330e130f330c8306730fd8f188a59308b30533068300230$$ENDHEX$$
			$$HEX1$$8b4f$$ENDHEX$$
				//$$HEX7$$7a76e86c58534d4fb330fc30c930$$ENDHEX$$
				//mes_h01,mes_h02,$$HEX3$$fb30fb30fb30$$ENDHEX$$etc.
				
		4.$$HEX8$$0454d730ed30b030e930e03067308230$$ENDHEX$$Itemchanged$$HEX24$$e651067492309f5b4c8857305f304430345808540130bc30ed30708a8130e651067492308d51a65e188af08f59308b30$$ENDHEX$$
		$$HEX6$$c55f81894c3042308b300230$$ENDHEX$$
		$$HEX22$$003008ff188af08f57306a30443034580854013068883a796f30bc30ed30708a813055308c308b304c300130$$ENDHEX$$data$$HEX13$$6f30bc30ed30708a813055308c306a3044305f308130023009ff$$ENDHEX$$
		
$$HEX37$$6a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a26$$ENDHEX$$
			$$HEX16$$745e086792303b4ead30fc306b3001636430de30b930bf306b30643044306630$$ENDHEX$$
			
		$$HEX19$$745e08670959f46642666b300454de30b930bf308d511c69227d59308b30e651067492300c30$$ENDHEX$$wf_date_change$$HEX4$$0d306b30fb79d552$$ENDHEX$$
		$$HEX13$$745e086792303b4ead30fc306b3001636430de30b930bf306730$$ENDHEX$$itemchange$$HEX10$$6b30fd8fa052188af08f4c3042308c3070300130$$ENDHEX$$
		$$HEX1$$0c30$$ENDHEX$$wf_date_change$$HEX24$$0d306b30745e08670959f46642666e308d511c69227de65106749230fd8fa052188af08f59308b30c55f8189a230ea30$$ENDHEX$$
		
		$$HEX1$$8b4f$$ENDHEX$$
			$$HEX9$$fa516567d89ac1540d54b330fc30c9306e30$$ENDHEX$$itemchanged$$HEX5$$e65106749230fd8fa052$$ENDHEX$$
			wf_date_change$$HEX1$$6b30$$ENDHEX$$
				$$HEX23$$fa516567d89ac1540d54b330fc30c9306830fa516567d89ac1540d546e308d511c69227de65106749230fd8fa052$$ENDHEX$$
			
$$HEX37$$6a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a266a26$$ENDHEX$$
		
$$HEX4$$5c4f1062e5650900$$ENDHEX$$2004.01.05	jupiter	tada

$$HEX4$$f466b065e5650900$$ENDHEX$$2006.03.11						$$HEX15$$bc30ed30708a8130fe5b618c6b304655c154b330fc30c9309230fd8fa052$$ENDHEX$$
	
___/___/___/___/___/___/____/___/___/___/___/___/___/____/___/___/___/___/___/___/____/ */

String			ls_prog_name, ls_moji, ls_column, ls_get_column_name, ls_moji_b
ps_hin			lstr_hin
ps_tani			lstr_tani
ps_prog			lstr_prog
ps_hinkubun		lstr_hinkubun
ps_bumon			lstr_bumon
ps_bumon			lstr_bumon2
ps_tkubun		lstr_tkubun
ps_kamoku		lstr_kamoku
ps_koutei		lstr_koutei
ps_line			lstr_line
ps_team			lstr_team
ps_event			lstr_event
ps_gun			lstr_gun
ps_kaiso_hin_kubun		lstr_kaiso_h_kbn
ps_haifu			lstr_haifu
ps_himoku		lstr_himoku
ps_tanto			lstr_tanto

String			ls_date,	ls_ki
boolean			lb_date_changed			//$$HEX12$$745e08674c300959f46655308c305f304b30693046304b30$$ENDHEX$$
Datetime			ldt_date
String			ls_hinkbn_no
String			ls_work, ls_moji2

ps_syohin		lstr_syohin
ps_torihiki		lstr_torihiki
ps_riyu			lstr_riyu
ps_printer		lstr_printer
ps_togo_line	lstr_togo_line
ps_kinmu			lstr_kinmu
ps_a_bunrui		lstr_a_bunrui

//initialize
lb_date_changed	= false

this.SetRedraw(False)

/*---------------------------------------------------------------------------------------
	$$HEX18$$d730ed30b030e930e03029ff24ff6e30d653975f08ff27598765575b6b300959db6309ff$$ENDHEX$$
---------------------------------------------------------------------------------------*/
ls_prog_name	= Upper(pf_nvl_string(gstr_kaisya.prog_name, ""))
/*---------------------------------------------------------------------------------------
	$$HEX6$$bc30ed30708a8130e6510674$$ENDHEX$$
---------------------------------------------------------------------------------------*/
choose case dwo.name
	case "$$HEX5$$e930d930e9306a75f753$$ENDHEX$$", "$$HEX6$$d730ea30f330bf306a75f753$$ENDHEX$$", "$$HEX5$$fe73c15468796a75f753$$ENDHEX$$"
		this.auto_zero_pack	= true
		data	= pf_zero_pack(data, this.get_column_len(dwo))
	case else
		this.auto_zero_pack	= false
end choose
this.post event zero_pack(row, dwo, data)

/*---------------------------------------------------------------------------------------
	$$HEX3$$71511a902000$$ENDHEX$$itemchanged $$HEX2$$e6510674$$ENDHEX$$
---------------------------------------------------------------------------------------*/
ls_column = dwo.name
Choose Case	ls_column
	/*------------------------------------------------------------------------------------
		$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$", "$$HEX8$$d54e6551c562535f0580b330fc30c930$$ENDHEX$$", "$$HEX8$$ba788d8ac562535f0580b330fc30c930$$ENDHEX$$","$$HEX8$$f466b065c562535f0580b330fc30c930$$ENDHEX$$"
		
		If	wf_mod_get(row, "$$HEX2$$745e0867$$ENDHEX$$"	, ls_date,	4)	Then
			lstr_tanto.$$HEX5$$745e0867090009000900$$ENDHEX$$= Datetime(Date(ls_date))
		End if
		
		Choose Case ls_column
			Case "$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$"
				ls_get_column_name = "$$HEX5$$c562535f05800d54f079$$ENDHEX$$"
			Case "$$HEX8$$d54e6551c562535f0580b330fc30c930$$ENDHEX$$"
				ls_get_column_name = "$$HEX7$$d54e6551c562535f05800d54f079$$ENDHEX$$"
			Case "$$HEX8$$ba788d8ac562535f0580b330fc30c930$$ENDHEX$$"
				ls_get_column_name = "$$HEX7$$ba788d8ac562535f05800d54f079$$ENDHEX$$"
			case "$$HEX8$$f466b065c562535f0580b330fc30c930$$ENDHEX$$"
				ls_get_column_name = "$$HEX7$$f466b065c562535f05800d54f079$$ENDHEX$$"
		End Choose
		
		If ls_prog_name <> "COM_M12" Then	/* com_m12 $$HEX7$$c562535f0580de30b930bf302000$$ENDHEX$$*/
			wf_mod_set(row, ls_column,	data, 1)										// $$HEX3$$bb30c330c830$$ENDHEX$$
			lstr_tanto.$$HEX7$$c562535f0580b330fc30c9302000$$ENDHEX$$= pf_nvl_string(data, "")
			pf_get_tanto(lstr_tanto)													// $$HEX3$$b230c330c830$$ENDHEX$$
			wf_mod_set(row, ls_get_column_name, lstr_tanto.$$HEX5$$c562535f05800d54f079$$ENDHEX$$, 1)	// $$HEX3$$bb30c330c830$$ENDHEX$$
		End If
		
	/*------------------------------------------------------------------------------------
		$$HEX5$$d730ed30b030e930e030$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$d730ed30b030e930e030$$ENDHEX$$"
		If ls_prog_name <> "COM_M04" Then	/* com_m04 $$HEX9$$d730ed30b030e930e030de30b930bf302000$$ENDHEX$$*/
			wf_mod_set(row,	"$$HEX5$$d730ed30b030e930e030$$ENDHEX$$",		data,	1)								// $$HEX3$$bb30c330c830$$ENDHEX$$
			lstr_prog.$$HEX6$$d730ed30b030e930e0302000$$ENDHEX$$= pf_nvl_string(data, "")
			pf_get_prog(lstr_prog)															// $$HEX3$$b230c330c830$$ENDHEX$$
			wf_mod_set(row,	"$$HEX7$$d730ed30b030e930e0300d54f079$$ENDHEX$$",	lstr_prog.$$HEX7$$d730ed30b030e930e0300d54f079$$ENDHEX$$, 1)	// $$HEX3$$bb30c330c830$$ENDHEX$$
		End If

	/*------------------------------------------------------------------------------------
		$$HEX4$$c154ee766a75f753$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX4$$c154ee766a75f753$$ENDHEX$$","$$HEX7$$2f63ff664d52c154ee766a75f753$$ENDHEX$$","$$HEX7$$2f63ff668c5fc154ee766a75f753$$ENDHEX$$","$$HEX6$$2375fa51c154ee766a75f753$$ENDHEX$$","$$HEX6$$95626551c154ee766a75f753$$ENDHEX$$","$$HEX6$$fe5bd46bc154ee766a75f753$$ENDHEX$$", &
			"$$HEX9$$2375fa51ef53fd80c154ee766a75f75311ff$$ENDHEX$$" ,"$$HEX9$$2375fa51ef53fd80c154ee766a75f75312ff$$ENDHEX$$" ,"$$HEX9$$2375fa51ef53fd80c154ee766a75f75313ff$$ENDHEX$$",	&
			"$$HEX9$$95626551ef53fd80c154ee766a75f75311ff$$ENDHEX$$" ,"$$HEX9$$95626551ef53fd80c154ee766a75f75312ff$$ENDHEX$$" ,"$$HEX9$$95626551ef53fd80c154ee766a75f75313ff$$ENDHEX$$",	&
			"$$HEX6$$e34eff66c154ee766a75f753$$ENDHEX$$", "$$HEX6$$8b95cb59c154ee766a75f753$$ENDHEX$$", "$$HEX6$$427d864ec154ee766a75f753$$ENDHEX$$", "$$HEX5$$505bc154ee766a75f753$$ENDHEX$$", "$$HEX7$$fa516567d89ac154ee766a75f753$$ENDHEX$$"
		
			If	wf_mod_get(row, "$$HEX2$$745e0867$$ENDHEX$$"	, ls_date,	4)	Then
				lstr_hin.$$HEX5$$745e0867090009000900$$ENDHEX$$= Datetime(Date(ls_date))
			End if
			
			ls_moji_b	= ""
			Choose Case	dwo.name
				Case	"$$HEX4$$c154ee766a75f753$$ENDHEX$$"
					ls_moji	= ""
				Case	"$$HEX7$$2f63ff664d52c154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX3$$2f63ff664d52$$ENDHEX$$"
				Case	"$$HEX7$$2f63ff668c5fc154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX3$$2f63ff668c5f$$ENDHEX$$"
				Case	"$$HEX6$$2375fa51c154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX2$$2375fa51$$ENDHEX$$"
				Case	"$$HEX6$$95626551c154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX2$$95626551$$ENDHEX$$"
				Case	"$$HEX6$$fe5bd46bc154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX2$$fe5bd46b$$ENDHEX$$"
				Case	"$$HEX9$$2375fa51ef53fd80c154ee766a75f75311ff$$ENDHEX$$"
					ls_moji	= "$$HEX4$$2375fa51ef53fd80$$ENDHEX$$"
					ls_moji_b	= "$$HEX1$$11ff$$ENDHEX$$"
				Case	"$$HEX9$$2375fa51ef53fd80c154ee766a75f75312ff$$ENDHEX$$"
					ls_moji	= "$$HEX4$$2375fa51ef53fd80$$ENDHEX$$"
					ls_moji_b	= "$$HEX1$$12ff$$ENDHEX$$"
				Case	"$$HEX9$$2375fa51ef53fd80c154ee766a75f75313ff$$ENDHEX$$"
					ls_moji	= "$$HEX4$$2375fa51ef53fd80$$ENDHEX$$"
					ls_moji_b	= "$$HEX1$$13ff$$ENDHEX$$"
				Case	"$$HEX9$$95626551ef53fd80c154ee766a75f75311ff$$ENDHEX$$"
					ls_moji	= "$$HEX4$$95626551ef53fd80$$ENDHEX$$"
					ls_moji_b	= "$$HEX1$$11ff$$ENDHEX$$"
				Case	"$$HEX9$$95626551ef53fd80c154ee766a75f75312ff$$ENDHEX$$"
					ls_moji	= "$$HEX4$$95626551ef53fd80$$ENDHEX$$"
					ls_moji_b	= "$$HEX1$$12ff$$ENDHEX$$"
				Case	"$$HEX9$$95626551ef53fd80c154ee766a75f75313ff$$ENDHEX$$"
					ls_moji	= "$$HEX4$$95626551ef53fd80$$ENDHEX$$"
					ls_moji_b	= "$$HEX1$$13ff$$ENDHEX$$"
				Case	"$$HEX6$$e34eff66c154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX2$$e34eff66$$ENDHEX$$"
				case "$$HEX6$$8b95cb59c154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX2$$8b95cb59$$ENDHEX$$"
				case "$$HEX6$$427d864ec154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX2$$427d864e$$ENDHEX$$"
				case "$$HEX5$$505bc154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX1$$505b$$ENDHEX$$"
				case "$$HEX7$$fa516567d89ac154ee766a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX3$$fa516567d89a$$ENDHEX$$"
			End Choose
			
			wf_mod_set(row, ls_moji + "$$HEX4$$c154ee766a75f753$$ENDHEX$$" + ls_moji_b, data, 1)			// $$HEX3$$bb30c330c830$$ENDHEX$$
			
			wf_mod_get(row,  ls_moji +"$$HEX5$$4655c154b330fc30c930$$ENDHEX$$" + ls_moji_b, lstr_hin.$$HEX5$$4655c154b330fc30c930$$ENDHEX$$, 1)
			lstr_hin.$$HEX5$$c154ee766a75f7532000$$ENDHEX$$= pf_nvl_string(data, "")
			pf_get_hin(lstr_hin)																	// $$HEX3$$b230c330c830$$ENDHEX$$
			
			wf_mod_set(row,	ls_moji + "$$HEX2$$c1540d54$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX2$$c1540d54$$ENDHEX$$, 1)	// $$HEX3$$bb30c330c830$$ENDHEX$$
			wf_mod_set(row,	ls_moji +"$$HEX4$$c78c23752e7a5e98$$ENDHEX$$" + ls_moji_b, lstr_hin.$$HEX4$$c78c23752e7a5e98$$ENDHEX$$, 1)	// $$HEX3$$bb30c330c830$$ENDHEX$$
			
			wf_mod_set(row,	ls_moji + "$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$" + ls_moji_b,lstr_hin.$$HEX2$$00670f5c$$ENDHEX$$.$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(row,	ls_moji + "$$HEX4$$58534d4f3a530652$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX2$$00670f5c$$ENDHEX$$.$$HEX4$$58534d4f3a530652$$ENDHEX$$, 1)
			wf_mod_set(row,	ls_moji + "$$HEX4$$58534d4f0d54f079$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX2$$00670f5c$$ENDHEX$$.$$HEX4$$58534d4f0d54f079$$ENDHEX$$, 1)
			
			wf_mod_set(row,	ls_moji + "$$HEX7$$0067275958534d4fb330fc30c930$$ENDHEX$$" + ls_moji_b,lstr_hin.$$HEX2$$00672759$$ENDHEX$$.$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(row,	ls_moji + "$$HEX6$$0067275958534d4f3a530652$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX2$$00672759$$ENDHEX$$.$$HEX4$$58534d4f3a530652$$ENDHEX$$, 1)
			wf_mod_set(row,	ls_moji + "$$HEX6$$0067275958534d4f0d54f079$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX2$$00672759$$ENDHEX$$.$$HEX4$$58534d4f0d54f079$$ENDHEX$$, 1)
			wf_mod_set(row, 	ls_moji + "$$HEX7$$2d4e939558534d4fb330fc30c930$$ENDHEX$$" + ls_moji_b,lstr_hin.$$HEX2$$2d4e9395$$ENDHEX$$.$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(row, 	ls_moji + "$$HEX6$$2d4e939558534d4f3a530652$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX2$$2d4e9395$$ENDHEX$$.$$HEX4$$58534d4f3a530652$$ENDHEX$$, 1)
			wf_mod_set(row, 	ls_moji + "$$HEX6$$2d4e939558534d4f0d54f079$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX2$$2d4e9395$$ENDHEX$$.$$HEX4$$58534d4f0d54f079$$ENDHEX$$, 1)
			wf_mod_set(row, 	ls_moji + "$$HEX7$$00670f5c58534d4fb330fc30c930$$ENDHEX$$" + ls_moji_b,lstr_hin.$$HEX2$$00670f5c$$ENDHEX$$.$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(row, 	ls_moji + "$$HEX6$$00670f5c58534d4f3a530652$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX2$$00670f5c$$ENDHEX$$.$$HEX4$$58534d4f3a530652$$ENDHEX$$, 1)
			wf_mod_set(row, 	ls_moji + "$$HEX6$$00670f5c58534d4f0d54f079$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX2$$00670f5c$$ENDHEX$$.$$HEX4$$58534d4f0d54f079$$ENDHEX$$, 1)
			wf_mod_set(row, 	ls_moji + "$$HEX6$$0067275958534d4f65517065$$ENDHEX$$" + ls_moji_b,	String(lstr_hin.$$HEX6$$0067275958534d4f65517065$$ENDHEX$$), 2)
			wf_mod_set(row, 	ls_moji + "$$HEX6$$2d4e939558534d4f65517065$$ENDHEX$$" + ls_moji_b,	String(lstr_hin.$$HEX6$$2d4e939558534d4f65517065$$ENDHEX$$), 2)
			
			wf_mod_set(row,	ls_moji + "$$HEX9$$ed30c330c8306a75f753a17b06743a530652$$ENDHEX$$" + ls_moji_b,	lstr_hin.$$HEX9$$ed30c330c8306a75f753a17b06743a530652$$ENDHEX$$, 1)
			
			//$$HEX2$$bb8cee76$$ENDHEX$$
			wf_mod_set(row,	ls_moji + "$$HEX5$$bb8cee76b330fc30c930$$ENDHEX$$" + ls_moji_b, lstr_hin.sisan.$$HEX4$$c35ec468bb8cee76$$ENDHEX$$.$$HEX5$$bb8cee76b330fc30c930$$ENDHEX$$, 1)
			wf_mod_set(row,	ls_moji + "$$HEX4$$bb8cee760d54f079$$ENDHEX$$" + ls_moji_b, lstr_hin.sisan.$$HEX4$$c35ec468bb8cee76$$ENDHEX$$.$$HEX4$$bb8cee760d54f079$$ENDHEX$$, 1)
			wf_mod_set(row,	ls_moji + "$$HEX7$$e930a430f330f476b28a3a530652$$ENDHEX$$" + ls_moji_b, lstr_hin.sisan.$$HEX4$$c35ec468bb8cee76$$ENDHEX$$.$$HEX7$$e930a430f330f476b28a3a530652$$ENDHEX$$, 1)
	/*------------------------------------------------------------------------------------
		$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	// $$HEX10$$c154ee76255258534d4fde30b930bf301c69227d$$ENDHEX$$
	Case	"$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$",	"$$HEX7$$7a76e86c58534d4fb330fc30c930$$ENDHEX$$","$$HEX7$$6972416d58534d4fb330fc30c930$$ENDHEX$$"
		Choose Case	dwo.name
			Case	"$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	= ""
			Case	"$$HEX7$$7a76e86c58534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX2$$7a76e86c$$ENDHEX$$"
			Case	"$$HEX7$$6972416d58534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX2$$6972416d$$ENDHEX$$"
		End Choose
		
		wf_mod_set(row,	ls_moji + "$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$",	data,	1)								// $$HEX3$$bb30c330c830$$ENDHEX$$
		
		lstr_tani.$$HEX6$$58534d4fb330fc30c9300900$$ENDHEX$$=	pf_nvl_string(data, "")
		
		If ls_prog_name <> "COM_M15" Then
			
			wf_mod_get(row,	"$$HEX4$$c154ee766a75f753$$ENDHEX$$",			lstr_tani.$$HEX4$$c154ee766a75f753$$ENDHEX$$,	1)
			
			If	wf_mod_get(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
				lstr_tani.$$HEX4$$745e086709000900$$ENDHEX$$= Datetime(Date(ls_date))
			End if
			
			pf_get_hin_tani(lstr_tani)												// $$HEX3$$b230c330c830$$ENDHEX$$
			
			wf_mod_set(row,	ls_moji + "$$HEX4$$58534d4f0d54f079$$ENDHEX$$",	lstr_tani.$$HEX4$$58534d4f0d54f079$$ENDHEX$$,	1)			// $$HEX3$$bb30c330c830$$ENDHEX$$
			wf_mod_set(row,	ls_moji + "$$HEX4$$58534d4f3a530652$$ENDHEX$$",	lstr_tani.$$HEX4$$58534d4f3a530652$$ENDHEX$$,	1)
			wf_mod_set(row,	ls_moji + "$$HEX4$$58534d4f65517065$$ENDHEX$$",	String(lstr_tani.$$HEX2$$65517065$$ENDHEX$$),		2)
		End If

	// $$HEX7$$58534d4fde30b930bf301c69227d$$ENDHEX$$
	Case	"$$HEX7$$00670f5c58534d4fb330fc30c930$$ENDHEX$$", "$$HEX7$$2d4e939558534d4fb330fc30c930$$ENDHEX$$", "$$HEX7$$0067275958534d4fb330fc30c930$$ENDHEX$$", "$$HEX7$$9562655158534d4fb330fc30c930$$ENDHEX$$", "$$HEX7$$cd91cf9158534d4fb330fc30c930$$ENDHEX$$", &
			"$$HEX7$$fc8cb78c58534d4fb330fc30c930$$ENDHEX$$", "$$HEX7$$886dbb8c58534d4fb330fc30c930$$ENDHEX$$"
		
		Choose Case	dwo.name
			Case	"$$HEX7$$00670f5c58534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	=	"$$HEX2$$00670f5c$$ENDHEX$$"
			Case	"$$HEX7$$2d4e939558534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	=	"$$HEX2$$2d4e9395$$ENDHEX$$"
			Case	"$$HEX7$$0067275958534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	=	"$$HEX2$$00672759$$ENDHEX$$"
			Case	"$$HEX7$$9562655158534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	=	"$$HEX2$$95626551$$ENDHEX$$"
			Case	"$$HEX7$$cd91cf9158534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	=	"$$HEX2$$cd91cf91$$ENDHEX$$"
			Case	"$$HEX7$$fc8cb78c58534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX2$$fc8cb78c$$ENDHEX$$"
			Case	"$$HEX7$$886dbb8c58534d4fb330fc30c930$$ENDHEX$$"
				ls_moji	= "$$HEX2$$886dbb8c$$ENDHEX$$"
		End Choose
		
		wf_mod_set(row,	ls_moji + "$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$",	data,	1)							// $$HEX3$$bb30c330c830$$ENDHEX$$
		
		lstr_tani.$$HEX6$$58534d4fb330fc30c9300900$$ENDHEX$$=	pf_nvl_string(data, "")
		pf_get_tani(lstr_tani)																// $$HEX3$$b230c330c830$$ENDHEX$$
		
		wf_mod_set(row,	ls_moji + "$$HEX4$$58534d4f0d54f079$$ENDHEX$$",	lstr_tani.$$HEX4$$58534d4f0d54f079$$ENDHEX$$,	1)		// $$HEX3$$bb30c330c830$$ENDHEX$$
		wf_mod_set(row,	ls_moji + "$$HEX4$$58534d4f3a530652$$ENDHEX$$",	lstr_tani.$$HEX4$$58534d4f3a530652$$ENDHEX$$,	1)

	/*------------------------------------------------------------------------------------
		$$HEX4$$c1540d543a530652$$ENDHEX$$01$$HEX1$$5eff$$ENDHEX$$20
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$c1540d543a53065211ff$$ENDHEX$$",	 "$$HEX5$$c1540d543a53065212ff$$ENDHEX$$",	  "$$HEX5$$c1540d543a53065213ff$$ENDHEX$$",   "$$HEX5$$c1540d543a53065214ff$$ENDHEX$$",   "$$HEX5$$c1540d543a53065215ff$$ENDHEX$$",		&
			"$$HEX5$$c1540d543a53065216ff$$ENDHEX$$",	 "$$HEX5$$c1540d543a53065217ff$$ENDHEX$$",   "$$HEX5$$c1540d543a53065218ff$$ENDHEX$$",   "$$HEX5$$c1540d543a53065219ff$$ENDHEX$$",   "$$HEX6$$c1540d543a53065211ff10ff$$ENDHEX$$",	&
			"$$HEX6$$c1540d543a53065211ff11ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff12ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff13ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff14ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff15ff$$ENDHEX$$",	&
			"$$HEX6$$c1540d543a53065211ff16ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff17ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff18ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065211ff19ff$$ENDHEX$$", "$$HEX6$$c1540d543a53065212ff10ff$$ENDHEX$$"
			
			wf_itemchanged_hinkubun(dwo.name, data, row, ls_prog_name)
	/*------------------------------------------------------------------------------------
		$$HEX4$$d653155f3a530652$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX4$$d653155f3a530652$$ENDHEX$$"
		If ls_prog_name <> "COM_M02" Then	/* com_m02 $$HEX8$$d653155f3a530652de30b930bf302000$$ENDHEX$$*/
			lstr_tkubun.$$HEX5$$d653155f3a5306522000$$ENDHEX$$= data
			
			if ls_prog_name = "MES_Z03" or ls_prog_name = "MES_Z05" then
				lstr_tkubun.$$HEX9$$4c7dbb8c2f63ff6665519b523b7562972000$$ENDHEX$$= "1"
			elseif ls_prog_name = "MES_N04" then	/* mes_n04 $$HEX5$$d54e655165519b522000$$ENDHEX$$*/
				lstr_tkubun.$$HEX7$$d54e655165519b523b7562972000$$ENDHEX$$= "1"
			end if
			pf_get_tkubun(lstr_tkubun)
			
			wf_mod_set(row, "$$HEX5$$d653155f3a5306520d54$$ENDHEX$$",	lstr_tkubun.$$HEX5$$d653155f3a5306520d54$$ENDHEX$$, 1)
		End If

	/*------------------------------------------------------------------------------------
		$$HEX2$$06743175$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$06743175b330fc30c930$$ENDHEX$$"
		Choose Case dwo.name
			Case "$$HEX5$$06743175b330fc30c930$$ENDHEX$$"
				ls_moji	= ""
		End Choose

		wf_mod_set(row, ls_moji + "$$HEX5$$06743175b330fc30c930$$ENDHEX$$",	data, 1)
		lstr_riyu.$$HEX6$$06743175b330fc30c9302000$$ENDHEX$$= pf_nvl_string(data, "")
		pf_get_riyu(lstr_riyu)
		wf_mod_set(row, ls_moji + "$$HEX4$$067431750d54f079$$ENDHEX$$", lstr_riyu.$$HEX4$$067431750d54f079$$ENDHEX$$, 1)
	/*------------------------------------------------------------------------------------
		$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$"
		If ls_prog_name <> "COM_M24" Then		//$$HEX5$$d179ee76de30b930bf30$$ENDHEX$$
			lstr_kamoku.$$HEX6$$d179ee76b330fc30c9300900$$ENDHEX$$= pf_nvl_String(data, "")
			pf_get_kamoku(lstr_kamoku)
			wf_mod_set(row, "$$HEX4$$d179ee760d54f079$$ENDHEX$$", lstr_kamoku.$$HEX4$$d179ee760d54f079$$ENDHEX$$, 1)
		End If

	/*------------------------------------------------------------------------------------
		$$HEX12$$e55d0b7afb30e930a430f330fb30717d0854e930a430f330$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$", "$$HEX6$$4d52e55d0b7ab330fc30c930$$ENDHEX$$"
		If (ls_prog_name = "COM_M18" AND ls_column = "$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$") = FALSE Then
			Choose Case	ls_column
				Case	"$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$"
					ls_get_column_name	= "$$HEX4$$e55d0b7a0d54f079$$ENDHEX$$"
				Case	"$$HEX6$$4d52e55d0b7ab330fc30c930$$ENDHEX$$"
					ls_get_column_name	= "$$HEX5$$4d52e55d0b7a0d54f079$$ENDHEX$$"
			End Choose
			
			If	wf_mod_get(row, "$$HEX2$$745e0867$$ENDHEX$$"	, ls_date,	4)	Then
				lstr_koutei.$$HEX5$$745e0867090009000900$$ENDHEX$$= Datetime(Date(ls_date))
			End if
			
			wf_mod_get(row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$"	, lstr_koutei.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$,	1)
			wf_mod_get(row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$"	, lstr_koutei.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$,	1)
			wf_mod_get(row, "$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$"	, lstr_koutei.$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$,	1)
						
			wf_mod_set(row, ls_column,	data,	1)										// $$HEX3$$bb30c330c830$$ENDHEX$$
			lstr_koutei.$$HEX6$$e55d0b7ab330fc30c9302000$$ENDHEX$$= pf_nvl_string(data, "")

			If	Not wf_mod_get(row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", lstr_koutei.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)	Then
				wf_mod_get(row, "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", lstr_koutei.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
			End if
			
			pf_get_koutei(lstr_koutei)													// $$HEX3$$b230c330c830$$ENDHEX$$
			
			wf_mod_set(row, ls_get_column_name,	 lstr_koutei.$$HEX4$$e55d0b7a0d54f079$$ENDHEX$$, 1)	// $$HEX3$$bb30c330c830$$ENDHEX$$
	
			If ls_column = "$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$" Then
				
				lstr_line.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= lstr_koutei.$$HEX2$$745e0867$$ENDHEX$$
				lstr_line.$$HEX8$$e930a430f330b330fc30c93009000900$$ENDHEX$$= lstr_koutei.$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$
				lstr_line.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_koutei.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
				pf_get_line(lstr_line)
				
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]		= "1"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]		= "3"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3]		= "5"

				lstr_bumon.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= lstr_line.$$HEX2$$745e0867$$ENDHEX$$
				lstr_bumon.$$HEX8$$e8908095b330fc30c930090009000900$$ENDHEX$$= lstr_line.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$
				pf_get_bumon2(lstr_bumon)
				
				If	wf_mod_chk(row, "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$",	1)	= 0	Then
					wf_mod_set(row, "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", 	lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,	 	1)
					wf_mod_set(row, "$$HEX5$$c24fe89080950d54f079$$ENDHEX$$", 	lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$,		 	1)
				End if
				If	wf_mod_chk(row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	1)	= 0	Then
					wf_mod_set(row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$",		lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,		1)
					wf_mod_set(row, "$$HEX4$$e89080950d54f079$$ENDHEX$$",		lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$,			1)
				End if
				
				If	wf_mod_chk(row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$",	1)	= 0	Then
					wf_mod_set(row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$",	lstr_koutei.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 	1)	// $$HEX3$$bb30c330c830$$ENDHEX$$
					wf_mod_set(row, "$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$"	,	lstr_koutei.$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$,		1)	// $$HEX3$$bb30c330c830$$ENDHEX$$
				End if
				If	wf_mod_chk(row, "$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$",	1)	= 0	Then
					wf_mod_set(row, "$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$",	lstr_koutei.$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$, 	1)	// $$HEX3$$bb30c330c830$$ENDHEX$$
					wf_mod_set(row, "$$HEX5$$e930a430f3300d54f079$$ENDHEX$$"	,	lstr_koutei.$$HEX5$$e930a430f3300d54f079$$ENDHEX$$,		1)	// $$HEX3$$bb30c330c830$$ENDHEX$$
				End if
			End If
		End If	

	Case	"$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$", "$$HEX8$$f8764b62e930a430f330b330fc30c930$$ENDHEX$$"
		If ls_prog_name <> "COM_M19" Then	//$$HEX6$$e930a430f330de30b930bf30$$ENDHEX$$
			
			Choose Case ls_column
				Case	"$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$"
					ls_moji	=	""
				Case	"$$HEX8$$f8764b62e930a430f330b330fc30c930$$ENDHEX$$"
					ls_moji	=	"$$HEX2$$f8764b62$$ENDHEX$$"
			End Choose
			
			If	wf_mod_Get(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
				lstr_line.$$HEX5$$745e0867090009000900$$ENDHEX$$= Datetime(Date(ls_date))
			End if
			
			If ls_column = "$$HEX8$$f8764b62e930a430f330b330fc30c930$$ENDHEX$$" Then
				wf_mod_Get(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$",		lstr_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$,	1)
			Else
				wf_mod_Get(row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$",	lstr_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$,	1)
				
				If	Not wf_mod_Get(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$",		lstr_line.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,	1)	Then
					wf_mod_Get(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$",		lstr_line.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,	1)
				End if
			End If
			wf_mod_Get(row, ls_moji + "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$",	lstr_line.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$,	1)
			
			wf_mod_get(row, "$$HEX5$$e930a430f3303a530652$$ENDHEX$$"		, lstr_line.$$HEX5$$e930a430f3303a530652$$ENDHEX$$, 1)
			
			lstr_line.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= pf_nvl_String(lstr_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, "")
			lstr_line.$$HEX8$$e930a430f330b330fc30c93009000900$$ENDHEX$$= pf_nvl_String(data, "")
			
			pf_get_line(lstr_line)
			
			wf_mod_set(row, ls_moji + "$$HEX5$$e930a430f3300d54f079$$ENDHEX$$", lstr_line.$$HEX5$$e930a430f3300d54f079$$ENDHEX$$, 1)
			
			if lstr_line.ret then
				
				lstr_bumon.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= lstr_line.$$HEX2$$745e0867$$ENDHEX$$
				lstr_bumon.$$HEX8$$e8908095b330fc30c930090009000900$$ENDHEX$$= lstr_line.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]		= "1"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]		= "3"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3]		= "5"
				pf_get_bumon2(lstr_bumon)
				
				If	wf_mod_chk(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", 1)	= 0	Then
					wf_mod_set(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", 	lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,	1)
					wf_mod_set(row, ls_moji + "$$HEX5$$c24fe89080950d54f079$$ENDHEX$$",		lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$,		1)
				End if
				If	wf_mod_chk(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 1)		= 0	Then
					wf_mod_set(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,	1)
					wf_mod_set(row, ls_moji + "$$HEX4$$e89080950d54f079$$ENDHEX$$",		lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$,		1)
				End if
			end if
			
			If ls_prog_name <> "COM_M18" AND ls_prog_name <> "COM_M43" Then	//$$HEX5$$e55d0b7ade30b930bf30$$ENDHEX$$,$$HEX5$$c130fc30e030e87d1062$$ENDHEX$$
				wf_mod_set(row, ls_moji + "$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$", "", 1)
				wf_mod_set(row, ls_moji + "$$HEX4$$e55d0b7a0d54f079$$ENDHEX$$", "", 1)
			End if
		End if

	Case	"$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$"
		If ls_prog_name <> "COM_M60" Then	//$$HEX8$$717d0854e930a430f330de30b930bf30$$ENDHEX$$
			
			ls_moji	= ""
			
			If	wf_mod_Get(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)	Then
				lstr_togo_line.$$HEX5$$745e0867090009000900$$ENDHEX$$= Datetime(Date(ls_date))
			End if
			
			wf_mod_Get(row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$",	lstr_togo_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$,	1)
			
			lstr_togo_line.$$HEX10$$e55d3458e8908095b330fc30c930090009000900$$ENDHEX$$= pf_nvl_String(lstr_togo_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, "")
			lstr_togo_line.$$HEX10$$717d0854e930a430f330b330fc30c93009000900$$ENDHEX$$= pf_nvl_String(data, "")
			
			pf_get_togo_line(lstr_togo_line)
			
			wf_mod_set(row, "$$HEX7$$717d0854e930a430f3300d54f079$$ENDHEX$$", lstr_togo_line.$$HEX7$$717d0854e930a430f3300d54f079$$ENDHEX$$,	1)
			
			// $$HEX6$$e55d3458e89080952d8a9a5b$$ENDHEX$$
			if lstr_togo_line.ret then
				lstr_bumon.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= lstr_togo_line.$$HEX2$$745e0867$$ENDHEX$$
				lstr_bumon.$$HEX8$$e8908095b330fc30c930090009000900$$ENDHEX$$= lstr_togo_line.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]		= "3"		// 3:$$HEX4$$e55d3458e8908095$$ENDHEX$$
				
				pf_get_bumon2(lstr_bumon)
				
				If	wf_mod_chk(row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", 1)		= 0	Then
					wf_mod_set(row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", 	lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,	1)
					wf_mod_set(row, "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$",		lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$,		1)
				End if
			end if

		End if

	/*------------------------------------------------------------------------------------
		$$HEX5$$e8908095de30b930bf30$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$","$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$","$$HEX8$$2f63ff664851e8908095b330fc30c930$$ENDHEX$$","$$HEX9$$fa51ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$","$$HEX9$$6551ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$" &
			,"$$HEX7$$f8764b62e8908095b330fc30c930$$ENDHEX$$","$$HEX8$$4351e55d3458e8908095b330fc30c930$$ENDHEX$$", "$$HEX8$$4851e55d3458e8908095b330fc30c930$$ENDHEX$$", "$$HEX6$$4851e8908095b330fc30c930$$ENDHEX$$"
		
		If (ls_prog_name = "COM_M11" AND ls_column = "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$") = FALSE Then	//$$HEX5$$e8908095de30b930bf30$$ENDHEX$$
		
			Choose Case ls_column
				Case "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$"
					Choose Case ls_prog_name
						Case "COM_G06"	//$$HEX9$$9f53a14f196a966e3fffc38c877365519b52$$ENDHEX$$
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "2"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3] = "3"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[4] = "4"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[5] = "5"
						Case "COM_G84"	//$$HEX9$$0867216bfd882090884e9f5bfe5bd46b6888$$ENDHEX$$
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "2"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3] = "3"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[4] = "4"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[5] = "5"
						Case Else
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
							lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3] = "5"
					End Choose
					
					wf_mod_get(row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
					ls_get_column_name = "$$HEX4$$e89080950d54f079$$ENDHEX$$"
				Case "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$"
					
					ls_moji = ""
					ls_get_column_name = "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$"
					
					wf_mod_get(row, "$$HEX4$$e89080953a530652$$ENDHEX$$", lstr_bumon.$$HEX4$$e89080953a530652$$ENDHEX$$, 1)
					
					//$$HEX5$$e8908095de30b930bf30$$ENDHEX$$.$$HEX16$$aa89e8908095b330fc30c9306e30345808540130e89080953a5306525e7d8a30$$ENDHEX$$
					If	ls_prog_name = "COM_M11"	Then
						Choose Case	lstr_bumon.$$HEX4$$e89080953a530652$$ENDHEX$$
							Case	"2"
								lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "1"
							Case	"4", "5"
								lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "3"
							Case	"7"
								lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "6"
							Case	Else
								lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
								lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
						End Choose
					Else
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
					End If
				Case "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$"
					ls_get_column_name = "$$HEX5$$c24fe89080950d54f079$$ENDHEX$$"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "5"
					wf_mod_get(row,	"$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$",	lstr_bumon.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$,	1)
				Case "$$HEX8$$2f63ff664851e8908095b330fc30c930$$ENDHEX$$"
					ls_get_column_name = "$$HEX7$$2f63ff664851e89080950d54f079$$ENDHEX$$"
				Case "$$HEX9$$fa51ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$"
					ls_moji	=	"$$HEX2$$fa51ab5e$$ENDHEX$$"
					ls_get_column_name = "$$HEX8$$fa51ab5ee55d3458e89080950d54f079$$ENDHEX$$"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
				Case "$$HEX9$$6551ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$"
					ls_moji	=	"$$HEX2$$6551ab5e$$ENDHEX$$"
					ls_get_column_name = "$$HEX8$$6551ab5ee55d3458e89080950d54f079$$ENDHEX$$"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
				Case "$$HEX7$$f8764b62e8908095b330fc30c930$$ENDHEX$$"
					ls_moji	=	"$$HEX2$$f8764b62$$ENDHEX$$"
					ls_get_column_name = "$$HEX6$$f8764b62e89080950d54f079$$ENDHEX$$"
				Case "$$HEX8$$4851e55d3458e8908095b330fc30c930$$ENDHEX$$"
					ls_moji	=	"$$HEX1$$4851$$ENDHEX$$"
					ls_get_column_name = "$$HEX7$$4851e55d3458e89080950d54f079$$ENDHEX$$"
				case "$$HEX6$$4851e8908095b330fc30c930$$ENDHEX$$"
					ls_moji	=	"$$HEX1$$4851$$ENDHEX$$"
					ls_get_column_name = "$$HEX5$$4851e89080950d54f079$$ENDHEX$$"
					
					if ls_prog_name	= "MES_J14" then	//$$HEX10$$315c6d6942669395fb79d5521d4f687965519b52$$ENDHEX$$
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "2"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3] = "3"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[4] = "4"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[5] = "6"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[6] = "7"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[7] = "8"
					else
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
						lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
					end if
				Case "$$HEX8$$4351e55d3458e8908095b330fc30c930$$ENDHEX$$"
					ls_moji	=	"$$HEX1$$4351$$ENDHEX$$"
					ls_get_column_name = "$$HEX7$$4351e55d3458e89080950d54f079$$ENDHEX$$"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1] = "1"
					lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2] = "3"
			End Choose
			
			wf_mod_get(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date,	4)
			lstr_bumon.$$HEX4$$745e086709000900$$ENDHEX$$= Datetime(Date(ls_date))
			lstr_bumon.$$HEX6$$e8908095b330fc30c9302000$$ENDHEX$$= pf_nvl_string(data, "")
						
			pf_get_bumon2(lstr_bumon)
			wf_mod_set(row,	ls_get_column_name,	lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$,	1)
			wf_mod_set(row,	"$$HEX12$$e55d3458e89080953fffed30c330c830a17b06743a530652$$ENDHEX$$",	lstr_bumon.$$HEX7$$ed30c330c830a17b06743a530652$$ENDHEX$$,	1)
			wf_mod_set(row,	"$$HEX4$$e55d34583a530652$$ENDHEX$$", lstr_bumon.$$HEX4$$e55d34583a530652$$ENDHEX$$, 1)
			
		End If
		
		If	ls_column	= "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$" or ls_column = "$$HEX9$$fa51ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$" or ls_column = "$$HEX9$$6551ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$"	or &
			ls_column = "$$HEX8$$4851e55d3458e8908095b330fc30c930$$ENDHEX$$" or ls_column = "$$HEX8$$4351e55d3458e8908095b330fc30c930$$ENDHEX$$" Then
			wf_mod_set(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$",	"", 1)
			wf_mod_set(row, ls_moji + "$$HEX5$$c24fe89080950d54f079$$ENDHEX$$",		"", 1)
			
			If	ls_prog_name <> "COM_M11"	Then
				wf_mod_set(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$",		"", 1)
				wf_mod_set(row, ls_moji + "$$HEX4$$e89080950d54f079$$ENDHEX$$",		"", 1)
			End if
			
			wf_mod_set(row, ls_moji + "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", 	"", 1)
			wf_mod_set(row, ls_moji + "$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$", 	"", 1)
			wf_mod_set(row, ls_moji + "$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$", 	"", 1)
			wf_mod_set(row, ls_moji + "$$HEX5$$e930a430f3300d54f079$$ENDHEX$$", 	"", 1)
			wf_mod_set(row, ls_moji + "$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$", 	"", 1)
			wf_mod_set(row, ls_moji + "$$HEX4$$e55d0b7a0d54f079$$ENDHEX$$", 		"", 1)
			wf_mod_set(row, ls_moji + "$$HEX4$$a47fb330fc30c930$$ENDHEX$$", 		"", 1)
			wf_mod_set(row, ls_moji + "$$HEX3$$a47f0d54f079$$ENDHEX$$", 			"", 1)
			wf_mod_set(row, ls_moji + "$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$", 	"", 1)
			wf_mod_set(row, ls_moji + "$$HEX4$$0950ab5e0d54f079$$ENDHEX$$", 		"", 1)
		Elseif	ls_column	= "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$"	OR	ls_column	= "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$"	Then
			If	ls_prog_name <> "COM_M17"	Then
				wf_mod_set(row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", 	"", 1)
				wf_mod_set(row, "$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$", 	"", 1)
				wf_mod_set(row, "$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$", 	"", 1)
				wf_mod_set(row, "$$HEX4$$0950ab5e0d54f079$$ENDHEX$$", 		"", 1)
			End if
			
			If	ls_prog_name <> "COM_M19"	Then
				wf_mod_set(row, "$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$", 	"", 1)
				wf_mod_set(row, "$$HEX5$$e930a430f3300d54f079$$ENDHEX$$", 	"", 1)
			End if
			
			If ls_prog_name <> "COM_M18" AND ls_prog_name <> "COM_M43" Then	//$$HEX5$$e55d0b7ade30b930bf30$$ENDHEX$$,$$HEX5$$c130fc30e030e87d1062$$ENDHEX$$
				wf_mod_set(row, "$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$", 	"", 1)
				wf_mod_set(row, "$$HEX4$$e55d0b7a0d54f079$$ENDHEX$$", 		"", 1)
			End if
			
			If	ls_prog_name <> "COM_M20" AND ls_prog_name <> "COM_M43"	Then	//$$HEX4$$a47fde30b930bf30$$ENDHEX$$,$$HEX5$$c130fc30e030e87d1062$$ENDHEX$$
				wf_mod_set(row, "$$HEX4$$a47fb330fc30c930$$ENDHEX$$", 		"", 1)
				wf_mod_set(row, "$$HEX3$$a47f0d54f079$$ENDHEX$$", 			"", 1)
			End if
		End if
		
/*------------------------------------------------------------------------------------
		$$HEX6$$c130fc30e030de30b930bf30$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", "$$HEX8$$fa51ab5ec130fc30e030b330fc30c930$$ENDHEX$$", "$$HEX8$$6551ab5ec130fc30e030b330fc30c930$$ENDHEX$$","$$HEX7$$4351c130fc30e030b330fc30c930$$ENDHEX$$", "$$HEX7$$4851c130fc30e030b330fc30c930$$ENDHEX$$"
		
		If	ls_prog_name <> "COM_M17"  Then
			wf_mod_Get(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)
			lstr_team.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= Datetime(Date(ls_date))
			
			Choose Case ls_column
				Case "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$"
					ls_moji = ""
				Case "$$HEX8$$fa51ab5ec130fc30e030b330fc30c930$$ENDHEX$$"
					ls_moji = "$$HEX2$$fa51ab5e$$ENDHEX$$"
				Case "$$HEX8$$6551ab5ec130fc30e030b330fc30c930$$ENDHEX$$"
					ls_moji = "$$HEX2$$6551ab5e$$ENDHEX$$"
				Case "$$HEX7$$4851c130fc30e030b330fc30c930$$ENDHEX$$"
					ls_moji = "$$HEX1$$4851$$ENDHEX$$"
				Case "$$HEX7$$4351c130fc30e030b330fc30c930$$ENDHEX$$"
					ls_moji = "$$HEX1$$4351$$ENDHEX$$"
			End Choose
			
			wf_mod_Get(row,ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$",		lstr_team.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 	1)
			lstr_team.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= pf_nvl_String(lstr_team.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, "")
			If	Not wf_mod_get(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)	Then
				wf_mod_get(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$",		lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
			End if
			lstr_team.$$HEX8$$c130fc30e030b330fc30c93009000900$$ENDHEX$$= pf_nvl_String(data, "")
			pf_get_Team(lstr_team)
			wf_mod_set(row, ls_moji + "$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$", lstr_team.$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$, 1)
			wf_mod_set(row, ls_moji + "$$HEX11$$c130fc30e0303fffed30c330c830a17b06743a530652$$ENDHEX$$", lstr_team.$$HEX7$$ed30c330c830a17b06743a530652$$ENDHEX$$, 1)

			If	lstr_team.ret	Then
				lstr_bumon.$$HEX8$$e8908095b330fc30c930090009000900$$ENDHEX$$= lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]		= "1"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]		= "3"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]		= "5"
				lstr_bumon.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= lstr_team.$$HEX2$$745e0867$$ENDHEX$$
				pf_get_bumon(lstr_bumon)
				
				If	wf_mod_chk(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", 	1)	= 0	Then
					wf_mod_set(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", 	lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
					wf_mod_set(row, ls_moji + "$$HEX5$$c24fe89080950d54f079$$ENDHEX$$",	lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$, 1)
				End if
				If	wf_mod_chk(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	1)	= 0	Then
					wf_mod_set(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
					wf_mod_set(row, ls_moji + "$$HEX4$$e89080950d54f079$$ENDHEX$$",	lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$, 1)
				End if
			End if	
			
			If ls_prog_name <> "COM_M18" AND ls_prog_name <> "COM_M43" Then	//$$HEX5$$e55d0b7ade30b930bf30$$ENDHEX$$,$$HEX5$$c130fc30e030e87d1062$$ENDHEX$$
				wf_mod_set(row, ls_moji + "$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$",	"", 1)
				wf_mod_set(row, ls_moji + "$$HEX4$$e55d0b7a0d54f079$$ENDHEX$$", 	"", 1)
				If	ls_prog_name <> "COM_M20"	Then
					wf_mod_set(row, ls_moji + "$$HEX4$$a47fb330fc30c930$$ENDHEX$$", 	"", 1)
					wf_mod_set(row, ls_moji + "$$HEX3$$a47f0d54f079$$ENDHEX$$", 		"", 1)
				End if
				If	ls_prog_name <> "COM_M28"	Then
					lstr_torihiki.$$HEX5$$745e0867090009000900$$ENDHEX$$=	lstr_team.$$HEX2$$745e0867$$ENDHEX$$
					lstr_torihiki.$$HEX7$$d653155f4851b330fc30c9300900$$ENDHEX$$=	lstr_team.$$HEX7$$196a966e0950ab5eb330fc30c930$$ENDHEX$$
					lstr_torihiki.$$HEX5$$0950ab5e090009000900$$ENDHEX$$=	'1'
					pf_get_torihiki(lstr_torihiki)
					
					wf_mod_set(row, ls_moji + "$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$", lstr_torihiki.$$HEX6$$d653155f4851b330fc30c930$$ENDHEX$$, 1)
					wf_mod_set(row, ls_moji + "$$HEX4$$0950ab5e0d54f079$$ENDHEX$$", 	lstr_torihiki.$$HEX5$$d653155f48516575f079$$ENDHEX$$, 1)
				End if
			End if	
			
		End if
		
/*------------------------------------------------------------------------------------
		$$HEX7$$a430d930f330c830de30b930bf30$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX7$$a430d930f330c830b330fc30c930$$ENDHEX$$"
		If ls_prog_name <> "COM_M05" Then		//$$HEX7$$a430d930f330c830de30b930bf30$$ENDHEX$$
			lstr_event.$$HEX8$$a430d930f330c830b330fc30c9300900$$ENDHEX$$= pf_nvl_String(data, "")
			pf_get_event(lstr_event)
			wf_mod_set(row, "$$HEX6$$a430d930f330c8300d54f079$$ENDHEX$$", lstr_event.$$HEX6$$a430d930f330c8300d54f079$$ENDHEX$$, 1)
		End If

/*------------------------------------------------------------------------------------
		$$HEX4$$a47fde30b930bf30$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX4$$a47fb330fc30c930$$ENDHEX$$"
		
		If ls_prog_name <> "COM_M20"	Then
			
			wf_mod_Get(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)
			lstr_gun.$$HEX6$$745e08670900090009000900$$ENDHEX$$= Datetime(Date(ls_date))

			wf_mod_Get(row,"$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$",lstr_gun.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
			lstr_gun.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= pf_nvl_String(lstr_gun.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, "")
			
			If	lstr_gun.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$<> ""	Then
				wf_mod_Get(row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", lstr_gun.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$,1)
				lstr_gun.$$HEX6$$a47fb330fc30c93009000900$$ENDHEX$$= pf_nvl_String(data, "")
				
				If	Not wf_mod_get(row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	lstr_gun.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)	Then
					wf_mod_get(row, "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", 	lstr_gun.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
				End if

				pf_get_Gun(lstr_gun)
				wf_mod_set(row, "$$HEX3$$a47f0d54f079$$ENDHEX$$", lstr_gun.$$HEX3$$a47f0d54f079$$ENDHEX$$, 1)
				wf_mod_set(row, "$$HEX5$$0763f356f8663a530652$$ENDHEX$$", lstr_gun.$$HEX5$$0763f356f8663a530652$$ENDHEX$$, 1)
		
				lstr_Team.$$HEX7$$745e086709000900090009000900$$ENDHEX$$= lstr_gun.$$HEX2$$745e0867$$ENDHEX$$
				lstr_Team.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_gun.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
				lstr_team.$$HEX8$$c130fc30e030b330fc30c93009000900$$ENDHEX$$= lstr_gun.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$
				pf_get_Team(lstr_Team)
				
				If	wf_mod_chk(row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", 1)	= 0	Then
					wf_mod_set(row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", 	lstr_team.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 1)
					wf_mod_set(row, "$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$", 	lstr_team.$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$, 	1)
				End if
				
				lstr_bumon.$$HEX6$$745e08670900090009000900$$ENDHEX$$= lstr_team.$$HEX2$$745e0867$$ENDHEX$$
				lstr_bumon.$$HEX7$$e8908095b330fc30c93009000900$$ENDHEX$$= lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon.$$HEX8$$e55d3458e8908095b330fc30c9300900$$ENDHEX$$= lstr_team.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]	= "1"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]	= "3"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3]	= "5"
				pf_get_Bumon2(lstr_bumon)
				If	wf_mod_chk(row, "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", 	1)	= 0	Then
					wf_mod_set(row, "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$",	lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 	1)
					wf_mod_set(row, "$$HEX5$$c24fe89080950d54f079$$ENDHEX$$", 	lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$, 	1)
				End if
				If	wf_mod_chk(row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	1)	= 0	Then
					wf_mod_set(row, "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 	1)
					wf_mod_set(row, "$$HEX4$$e89080950d54f079$$ENDHEX$$", 		lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$, 	1)
				End if
			End if
		End if
	
/*------------------------------------------------------------------------------------
	$$HEX4$$8e96645c3a530652$$ENDHEX$$
------------------------------------------------------------------------------------*/
	Case	"$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$","$$HEX7$$8e96645cc1540d543a53065212ff$$ENDHEX$$","$$HEX7$$8e96645cc1540d543a53065213ff$$ENDHEX$$","$$HEX7$$8e96645cc1540d543a53065214ff$$ENDHEX$$","$$HEX7$$8e96645cc1540d543a53065215ff$$ENDHEX$$"
		wf_itemchanged_kaiso(dwo.name, data, row, ls_prog_name)
/*------------------------------------------------------------------------------------
		$$HEX4$$4d91e68cfa57966e$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX7$$4d91e68cfa57966eb330fc30c930$$ENDHEX$$"
		If ls_prog_name <> "COM_M36" Then		//$$HEX7$$4d91e68cfa57966ede30b930bf30$$ENDHEX$$
			lstr_haifu.$$HEX8$$4d91e68cfa57966eb330fc30c9300900$$ENDHEX$$= pf_nvl_String(data, "")
			pf_get_haifu(lstr_haifu)
			wf_mod_set(row, "$$HEX6$$4d91e68cfa57966e0d54f079$$ENDHEX$$", lstr_haifu.$$HEX6$$4d91e68cfa57966e0d54f079$$ENDHEX$$, 1)
		End If
		
/*------------------------------------------------------------------------------------
		$$HEX2$$bb8cee76$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX5$$bb8cee76b330fc30c930$$ENDHEX$$"
		If ls_prog_name <> "COM_M38" Then		//$$HEX5$$bb8cee76de30b930bf30$$ENDHEX$$
			lstr_himoku.$$HEX6$$bb8cee76b330fc30c9300900$$ENDHEX$$= pf_nvl_String(data, "")
			if ls_prog_name = "MES_Z03" then
				lstr_himoku.$$HEX9$$d65371621d4f68793652a15f3a5306520900$$ENDHEX$$= "1"
			end if
			pf_get_himoku(lstr_himoku)
			wf_mod_set(row, "$$HEX4$$bb8cee760d54f079$$ENDHEX$$", lstr_himoku.$$HEX4$$bb8cee760d54f079$$ENDHEX$$, 1)
		End If

/*------------------------------------------------------------------------------------
		$$HEX2$$4655c154$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX5$$4655c154b330fc30c930$$ENDHEX$$"
		wf_mod_Get(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)
		lstr_syohin.$$HEX5$$745e0867090009000900$$ENDHEX$$= Datetime(Date(ls_date))
		lstr_syohin.$$HEX6$$4655c154b330fc30c9300900$$ENDHEX$$= pf_nvl_String(data, "")
		pf_get_syohin(lstr_syohin)
		wf_mod_set(row, "$$HEX4$$4655c1540d54f079$$ENDHEX$$", lstr_syohin.$$HEX4$$4655c1540d54f079$$ENDHEX$$, 1)
		
		if ls_prog_name <> "COM_M40" then	//$$HEX7$$7a6c9a5b5853a14fde30b930bf30$$ENDHEX$$
			wf_mod_set(row, "$$HEX4$$c154ee766a75f753$$ENDHEX$$",	"", 1)
			wf_mod_set(row, "$$HEX2$$c1540d54$$ENDHEX$$",			"", 1)
		end if

/*------------------------------------------------------------------------------------
		$$HEX4$$c78c23752e7a5e98$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX4$$c78c23752e7a5e98$$ENDHEX$$", "$$HEX6$$8b95cb59c78c23752e7a5e98$$ENDHEX$$", "$$HEX6$$427d864ec78c23752e7a5e98$$ENDHEX$$","$$HEX6$$e34eff66c78c23752e7a5e98$$ENDHEX$$"
		choose case dwo.name
			case "$$HEX4$$c78c23752e7a5e98$$ENDHEX$$"
				ls_moji	= ""
			case "$$HEX6$$8b95cb59c78c23752e7a5e98$$ENDHEX$$"
				ls_moji	= "$$HEX2$$8b95cb59$$ENDHEX$$"
			case "$$HEX6$$427d864ec78c23752e7a5e98$$ENDHEX$$"
				ls_moji	= "$$HEX2$$427d864e$$ENDHEX$$"
			case "$$HEX6$$e34eff66c78c23752e7a5e98$$ENDHEX$$"
				ls_moji	= "$$HEX2$$e34eff66$$ENDHEX$$"
		end choose
		
		wf_mod_set(row, ls_moji + "$$HEX4$$c154ee766a75f753$$ENDHEX$$",	"", 1)
		wf_mod_set(row, ls_moji	+ "$$HEX2$$c1540d54$$ENDHEX$$",			"", 1)

/*------------------------------------------------------------------------------------
		$$HEX11$$d653155f485108ff0950ab5efb30d54e6551485109ff$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$", "$$HEX6$$d54e65514851b330fc30c930$$ENDHEX$$","$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$","$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$", "$$HEX6$$1659e86c4851b330fc30c930$$ENDHEX$$", "$$HEX8$$fb79d55248510950ab5eb330fc30c930$$ENDHEX$$", "$$HEX6$$0d7dc1544851b330fc30c930$$ENDHEX$$","$$HEX5$$6972416db330fc30c930$$ENDHEX$$"
		If ls_prog_name <> "COM_M28" Then
			wf_mod_Get(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)
			lstr_torihiki.$$HEX5$$745e0867090009000900$$ENDHEX$$= Datetime(Date(ls_date))
			lstr_torihiki.$$HEX7$$d653155f4851b330fc30c9300900$$ENDHEX$$= pf_nvl_String(data, "")
			
			Choose Case	ls_column
				Case	"$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$"
					lstr_torihiki.$$HEX5$$0950ab5e090009000900$$ENDHEX$$= "1"
					ls_moji							=	""
					ls_moji2							= "$$HEX2$$0950ab5e$$ENDHEX$$"
				Case	"$$HEX6$$d54e65514851b330fc30c930$$ENDHEX$$"
					lstr_torihiki.$$HEX6$$d54e65514851090009000900$$ENDHEX$$= "1"
					ls_moji							=	""
					ls_moji2							= "$$HEX3$$d54e65514851$$ENDHEX$$"
				Case	"$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$"
					lstr_torihiki.$$HEX5$$0950ab5e090009000900$$ENDHEX$$= "1"
					ls_moji							=	"$$HEX2$$fa51ab5e$$ENDHEX$$"
					ls_moji2							= "$$HEX4$$fa51ab5e0950ab5e$$ENDHEX$$"
				Case	"$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$"
					lstr_torihiki.$$HEX5$$0950ab5e090009000900$$ENDHEX$$= "1"
					ls_moji							=	"$$HEX2$$6551ab5e$$ENDHEX$$"
					ls_moji2							= "$$HEX4$$6551ab5e0950ab5e$$ENDHEX$$"
				Case	"$$HEX6$$1659e86c4851b330fc30c930$$ENDHEX$$"
					lstr_torihiki.$$HEX6$$d54e65514851090009000900$$ENDHEX$$= "1"
					ls_moji							=	""
					ls_moji2							= "$$HEX3$$1659e86c4851$$ENDHEX$$"
				Case	"$$HEX8$$fb79d55248510950ab5eb330fc30c930$$ENDHEX$$"
					lstr_torihiki.$$HEX5$$0950ab5e090009000900$$ENDHEX$$= "1"
					ls_moji							=	"$$HEX3$$fb79d5524851$$ENDHEX$$"
					ls_moji2							= "$$HEX5$$fb79d55248510950ab5e$$ENDHEX$$"
				case	"$$HEX6$$0d7dc1544851b330fc30c930$$ENDHEX$$"
					lstr_torihiki.$$HEX6$$0d7dc1544851090009000900$$ENDHEX$$= "1"
					ls_moji							= ""
					ls_moji2							= "$$HEX3$$0d7dc1544851$$ENDHEX$$"
				case	"$$HEX5$$6972416db330fc30c930$$ENDHEX$$"
					lstr_torihiki.$$HEX6$$0d7dc1544851090009000900$$ENDHEX$$= "1"
					ls_moji							= ""
					ls_moji2							= "$$HEX2$$6972416d$$ENDHEX$$"
			End Choose
			
			IF	ls_column	= "$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$" or ls_column = "$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$" or ls_column = "$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$"	THEN
				//$$HEX18$$e55d3458e89080950130e89080950130c130fc30e0306f300950ab5ea295c24f6e307f30$$ENDHEX$$
				wf_mod_get(row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$", 	lstr_torihiki.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
				If	Not wf_mod_get(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$", 	lstr_torihiki.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)	Then
					wf_mod_get(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$", 	lstr_torihiki.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$, 1)
				End if
				wf_mod_get(row, ls_moji + "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", 	lstr_torihiki.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 1)
			END IF
			
			pf_get_torihiki(lstr_torihiki)
			wf_mod_set(row, ls_moji2	+ "$$HEX2$$0d54f079$$ENDHEX$$", lstr_torihiki.$$HEX5$$d653155f48516575f079$$ENDHEX$$, 1)
			
			If ls_column = "$$HEX6$$d54e65514851b330fc30c930$$ENDHEX$$" Then
				wf_mod_set(row, "$$HEX9$$fa51ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$",	lstr_torihiki.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$, 1)
				wf_mod_set(row, "$$HEX8$$fa51ab5ec130fc30e030b330fc30c930$$ENDHEX$$", 	lstr_torihiki.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 1)
			End If
			
			If	ls_column	= "$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$" or ls_column = "$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$" or ls_column = "$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$"	Then
				lstr_bumon.$$HEX8$$745e0867090009000900090009000900$$ENDHEX$$= lstr_torihiki.$$HEX2$$745e0867$$ENDHEX$$
				lstr_bumon.$$HEX9$$e8908095b330fc30c9300900090009000900$$ENDHEX$$= lstr_torihiki.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]			= "1"
				lstr_bumon.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]			= "3"
				pf_get_bumon2(lstr_bumon)
				
				If	wf_mod_chk(row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$",	1)	= 0	Then
					wf_mod_set(row, ls_moji + "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$",	lstr_bumon.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,	1)
					wf_mod_set(row, ls_moji + "$$HEX6$$e55d3458e89080950d54f079$$ENDHEX$$",		lstr_bumon.$$HEX4$$e89080950d54f079$$ENDHEX$$,		1)
				End if
				
				lstr_team.$$HEX9$$745e08670900090009000900090009000900$$ENDHEX$$= lstr_torihiki.$$HEX2$$745e0867$$ENDHEX$$
				lstr_team.$$HEX10$$e55d3458e8908095b330fc30c930090009000900$$ENDHEX$$= lstr_torihiki.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$
				lstr_team.$$HEX10$$c130fc30e030b330fc30c9300900090009000900$$ENDHEX$$= lstr_torihiki.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$
				pf_get_Team(lstr_team)
				
				If	wf_mod_chk(row, ls_moji + "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$", 1)	= 0	Then
					wf_mod_set(row, ls_moji + "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$",	lstr_torihiki.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$, 1)
					wf_mod_set(row, ls_moji + "$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$", 	lstr_team.$$HEX5$$c130fc30e0300d54f079$$ENDHEX$$,			1)
				End if
				
				lstr_bumon2.$$HEX8$$745e0867090009000900090009000900$$ENDHEX$$= lstr_torihiki.$$HEX2$$745e0867$$ENDHEX$$
				lstr_bumon2.$$HEX9$$e8908095b330fc30c9300900090009000900$$ENDHEX$$= lstr_team.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[1]		= "1"
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[2]		= "3"
				lstr_bumon2.$$HEX6$$e89080953a5306524d911752$$ENDHEX$$[3]		= "5"
				pf_get_bumon2(lstr_bumon2)
				
				If	wf_mod_chk(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$",	1)		= 0	Then
					wf_mod_set(row, ls_moji + "$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$",	lstr_bumon2.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,	1)
					wf_mod_set(row, ls_moji + "$$HEX5$$c24fe89080950d54f079$$ENDHEX$$",		lstr_bumon2.$$HEX4$$e89080950d54f079$$ENDHEX$$,	1)
				End if
				If	wf_mod_chk(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$",		1)		= 0	Then
					wf_mod_set(row, ls_moji + "$$HEX5$$e8908095b330fc30c930$$ENDHEX$$",		lstr_bumon2.$$HEX5$$e8908095b330fc30c930$$ENDHEX$$,	1)
					wf_mod_set(row, ls_moji + "$$HEX4$$e89080950d54f079$$ENDHEX$$",		lstr_bumon2.$$HEX4$$e89080950d54f079$$ENDHEX$$,	1)
				End if
			End if
		End If	

/*------------------------------------------------------------------------------------
	$$HEX4$$d730ea30f330bf30$$ENDHEX$$
------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$e930d930e9306a75f753$$ENDHEX$$", "$$HEX6$$d730ea30f330bf306a75f753$$ENDHEX$$"
		if ls_prog_name <> "COM_M54" Then		//$$HEX9$$d730ea30f330bf30de30b930bf30e54e1659$$ENDHEX$$
			Choose Case dwo.name
				Case "$$HEX5$$e930d930e9306a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX3$$e930d930e930$$ENDHEX$$"
					lstr_printer.$$HEX7$$d730ea30f330bf303a5306520900$$ENDHEX$$= "1"
				case "$$HEX6$$d730ea30f330bf306a75f753$$ENDHEX$$"
					ls_moji	= "$$HEX4$$d730ea30f330bf30$$ENDHEX$$"
					lstr_printer.$$HEX7$$d730ea30f330bf303a5306520900$$ENDHEX$$= "2"
			End Choose
			lstr_printer.$$HEX7$$d730ea30f330bf306a75f7530900$$ENDHEX$$= pf_nvl_String(data, "")
					
			If	wf_mod_get(row, "$$HEX2$$745e0867$$ENDHEX$$"	, ls_date,	4)	Then
				lstr_printer.$$HEX5$$745e0867090009000900$$ENDHEX$$= Datetime(Date(ls_date))
			End if
			wf_mod_get(row, "$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$"	, lstr_printer.$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$,	1)
			wf_mod_get(row, "$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$"	, lstr_printer.$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$,	1)
			pf_get_printer(lstr_printer)		
			wf_mod_set(row, ls_moji	+ "$$HEX2$$0d54f079$$ENDHEX$$", lstr_printer.$$HEX6$$d730ea30f330bf300d54f079$$ENDHEX$$, 1)
		end if
/*------------------------------------------------------------------------------------
	$$HEX2$$e452d952$$ENDHEX$$
------------------------------------------------------------------------------------*/
	Case	"$$HEX5$$e452d952b330fc30c930$$ENDHEX$$"

		lstr_kinmu.$$HEX6$$e452d952b330fc30c9300900$$ENDHEX$$= pf_nvl_String(data, "")
				
		pf_get_kinmu(lstr_kinmu)		
		wf_mod_set(row, "$$HEX4$$e452d9520d54f079$$ENDHEX$$", lstr_kinmu.$$HEX4$$e452d9520d54f079$$ENDHEX$$, 1)

/*------------------------------------------------------------------------------------
	$$HEX2$$e452d952$$ENDHEX$$
------------------------------------------------------------------------------------*/
	Case	"$$HEX6$$41ff06525e98b330fc30c930$$ENDHEX$$"

		lstr_a_bunrui.$$HEX7$$41ff06525e98b330fc30c9300900$$ENDHEX$$= pf_nvl_String(data, "")
				
		pf_get_a_bunrui(lstr_a_bunrui)		
		wf_mod_set(row, "$$HEX5$$41ff06525e980d54f079$$ENDHEX$$", lstr_a_bunrui.$$HEX5$$41ff06525e980d54f079$$ENDHEX$$, 1)
		
		
		
		
/*------------------------------------------------------------------------------------
		$$HEX4$$427d864e745e0867$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX4$$427d864e745e0867$$ENDHEX$$", "$$HEX5$$088a3b75427d864ee565$$ENDHEX$$", "$$HEX4$$1c69227d745e0867$$ENDHEX$$", "$$HEX5$$d7535562e565427d864e$$ENDHEX$$","$$HEX5$$088a0a4ee565427d864e$$ENDHEX$$", "$$HEX5$$0190d84ee565427d864e$$ENDHEX$$", "$$HEX4$$e565d84e427d864e$$ENDHEX$$"&
		  , "$$HEX5$$fb79d552e565427d864e$$ENDHEX$$", "$$HEX6$$d75355621f679395427d864e$$ENDHEX$$", "$$HEX5$$0763f356e565427d864e$$ENDHEX$$", "$$HEX7$$6551ab5e884e9a5be565427d864e$$ENDHEX$$", "$$HEX5$$6551ab5e427d864ee565$$ENDHEX$$", "$$HEX4$$7a76e86c745e0867$$ENDHEX$$"&
		  ,"$$HEX5$$d54e6551e565427d864e$$ENDHEX$$","$$HEX6$$088a3b75427d864e745e0867$$ENDHEX$$", "$$HEX5$$6551ab5e884e9a5be565$$ENDHEX$$to", "$$HEX5$$fa51ab5e884e9a5be565$$ENDHEX$$to", "$$HEX5$$7a76e86c50964c75e565$$ENDHEX$$to", "$$HEX5$$0d7d1f67427d864ee565$$ENDHEX$$", "$$HEX6$$fa516567d89ae565427d864e$$ENDHEX$$"&
		  ,"$$HEX4$$088a3b75745e0867$$ENDHEX$$","$$HEX7$$0190d84e884e9a5be565427d864e$$ENDHEX$$", "$$HEX4$$427d864e1f679395$$ENDHEX$$", "$$HEX5$$fa517783427d864ee565$$ENDHEX$$", "$$HEX5$$95626551e565427d864e$$ENDHEX$$", "$$HEX4$$1f679395427d864e$$ENDHEX$$", "$$HEX5$$e6510674e565427d864e$$ENDHEX$$"
//		  ,"$$HEX7$$7a76e86c50964c75e565427d864e$$ENDHEX$$" del 2007.11.07
		ldt_date = Datetime(Date(data))
		ldt_date = pf_get_master_date(ldt_date)			//$$HEX13$$0967b9526a30de30b930bf301c69227d745e08679230d653975f$$ENDHEX$$
		ls_date = string(ldt_date)
		wf_mod_set(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date , 4)
		lb_date_changed = TRUE
	Case	"$$HEX4$$fa57966e745e0867$$ENDHEX$$", "$$HEX2$$e565d84e$$ENDHEX$$", "$$HEX3$$088a0a4ee565$$ENDHEX$$","$$HEX3$$fa57966ee565$$ENDHEX$$","$$HEX3$$fa51ab5ee565$$ENDHEX$$", "$$HEX2$$0d7d1f67$$ENDHEX$$", "$$HEX3$$0763f356e565$$ENDHEX$$", "$$HEX2$$0867a65e$$ENDHEX$$", "$$HEX3$$0190d84ee565$$ENDHEX$$", "$$HEX3$$d54e6551e565$$ENDHEX$$", "$$HEX3$$5c4f6d69e565$$ENDHEX$$", "$$HEX3$$088acf91e565$$ENDHEX$$"&
			,"$$HEX5$$6551ab5e884e9a5be565$$ENDHEX$$"
		If	isNull(data)	OR String(Date(data))	= "1900/01/01"	then	//NULL$$HEX9$$6e3034580854535f08679230bb30c330c830$$ENDHEX$$
			ldt_date	= pf_get_master_date(Datetime(pf_get_sysdate()))
		Else
			ldt_date = Datetime(Date(data))
			ldt_date = pf_get_master_date(ldt_date)			//$$HEX13$$0967b9526a30de30b930bf301c69227d745e08679230d653975f$$ENDHEX$$
		End If	
		
		ls_date = string(ldt_date)
		wf_mod_set(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date , 4)
		lb_date_changed = TRUE
/*------------------------------------------------------------------------------------
		$$HEX2$$745e0867$$ENDHEX$$
------------------------------------------------------------------------------------*/		
	Case	"$$HEX2$$745e0867$$ENDHEX$$"
		lb_date_changed = TRUE
/*------------------------------------------------------------------------------------
		$$HEX2$$745e2000$$ENDHEX$$/ $$HEX1$$1f67$$ENDHEX$$
------------------------------------------------------------------------------------*/
	Case	"$$HEX1$$745e$$ENDHEX$$", "$$HEX1$$1f67$$ENDHEX$$"
		If ls_column = "$$HEX1$$745e$$ENDHEX$$" Then
			ldt_date = Datetime(Date(data))		// $$HEX3$$745ed653975f$$ENDHEX$$
			wf_mod_get(row, "$$HEX1$$1f67$$ENDHEX$$", ls_ki, 1)
		Else
			wf_mod_get(row, "$$HEX1$$745e$$ENDHEX$$", ls_date, 4)	// $$HEX3$$745ed653975f$$ENDHEX$$
			ldt_date	= Datetime(Date(ls_date))
			ls_ki	=	data								// $$HEX3$$1f67d653975f$$ENDHEX$$
		End If
		// $$HEX11$$c730fc30bf302e7a25526b308830633066303652a15f$$ENDHEX$$
		If wf_mod_get(row, "$$HEX5$$c730fc30bf302e7a2552$$ENDHEX$$", ls_work, 1) Then
			// $$HEX11$$9f53a14f196a966ea29523906e30345808546a306930$$ENDHEX$$
			If ls_work = "3" or ls_work = "4" Then	//3:$$HEX5$$216b1f67196a966e2000$$ENDHEX$$4:$$HEX4$$e55d3458196a966e$$ENDHEX$$
				// $$HEX18$$216b1f6728756e30ba7001300067b065de30b930bf30dd4f0163745e08679230d653975f$$ENDHEX$$
				ls_date		= String(pf_kaisya_day(1, "40004"))
			ElseIf ls_work = "1" Then						//1:$$HEX4$$1a4f088a196a966e$$ENDHEX$$
				// $$HEX16$$535f1f6728756e30ba700130535f728a1f67427d864e0867a65e9230d653975f$$ENDHEX$$
				ldt_date	= Datetime(pf_add_months(Date(pf_get_ki_sta2( ldt_date, ls_ki)), 5))
				// $$HEX27$$535f728a1f67427d864e0867a65e4c302a6765670130823057304f306f30dd4f0163745e0867e54e4d526e30345808546b30fe5bdc5f$$ENDHEX$$
				ls_date		= String(pf_get_master_date(ldt_date))			//$$HEX13$$0967b9526a30de30b930bf301c69227d745e08679230d653975f$$ENDHEX$$
			End If
		Else
			// $$HEX9$$335e6879a29523906e30345808546a306930$$ENDHEX$$
			// $$HEX16$$535f1f6728756e30ba700130535f728a1f67427d864e0867a65e9230d653975f$$ENDHEX$$
			ldt_date	= Datetime(pf_add_months(Date(pf_get_ki_sta2( ldt_date, ls_ki)), 5))
			// $$HEX27$$535f728a1f67427d864e0867a65e4c302a6765670130823057304f306f30dd4f0163745e0867e54e4d526e30345808546b30fe5bdc5f$$ENDHEX$$
			ls_date		= String(pf_get_master_date(ldt_date))			//$$HEX13$$0967b9526a30de30b930bf301c69227d745e08679230d653975f$$ENDHEX$$
		End If
		wf_mod_set(row, "$$HEX2$$745e0867$$ENDHEX$$", ls_date, 4)
		lb_date_changed = True

End Choose
/*------------------------------------------------------------------------------------
		$$HEX4$$745e0867e6510674$$ENDHEX$$
------------------------------------------------------------------------------------*/
//$$HEX19$$745e08674c300959f46655308c30663044308c3070300454de30b930bf3092308d511c69227d$$ENDHEX$$
If	lb_date_changed	Then
	wf_date_change(row, data, ls_column, ls_prog_name)
End if

this.SetRedraw(True)
end event

on com_pu_dw.create
end on

on com_pu_dw.destroy
end on

event dberror;
pf_db_err(This,	row,	sqldbcode,	sqlerrtext)
end event

event buttonclicked;/*___/___/___/___/___/___/____/___/___/___/___/___/___/____/___/___/___/___/___/___/____/

$$HEX10$$ac8a0e660900997d7f626b30663071511a906e30$$ENDHEX$$buttonclicked$$HEX6$$e651067492304c8846300230$$ENDHEX$$
		
		1.com_pw.pbl$$HEX4$$6830bb30c330c830$$ENDHEX$$
		
		2.$$HEX20$$ab30e930e0306e30585b2857c130a730c330af308c5f6b30e65106749230188af08f59308b300230$$ENDHEX$$(wf_button_clicked$$HEX2$$6b306630$$ENDHEX$$)
			//$$HEX16$$de56e28ed2896b3088308b30ab30e930e0306e30585b2857c130a730c330af30$$ENDHEX$$
			ls_mod	=	This.Modify("$$HEX4$$c154ee766a75f753$$ENDHEX$$.Font.Escapement = 0")
			
		3.$$HEX32$$d730ed30b030e930e030fa5609676e30345808540c30d730ed30b030e930e03029ff24ff0d309230b330e130f330c8306730fd8f188a59308b30533068300230$$ENDHEX$$
			$$HEX1$$8b4f$$ENDHEX$$
				//$$HEX7$$7a76e86c58534d4fb330fc30c930$$ENDHEX$$
				//mes_h01,mes_h02,$$HEX3$$fb30fb30fb30$$ENDHEX$$etc.
				
		4.$$HEX7$$dc30bf30f3300d54f0796f300130$$ENDHEX$$com,scm,mes$$HEX8$$6730004e0f616b3059308b3053306830$$ENDHEX$$
		$$HEX7$$0030cd91078959308b3068300130$$ENDHEX$$com$$HEX6$$6730d55244305f308c5f0130$$ENDHEX$$scm($$HEX4$$823057304f306f30$$ENDHEX$$mes)$$HEX8$$6730d5524430663057307e3046300230$$ENDHEX$$
				
		$$HEX15$$e86c0f6108ffe265585bd730ed30b030e930e0306b30fe5b5730663009ff$$ENDHEX$$
			$$HEX19$$53306e30e65106749230997d7f62485167302a51485184766b306990287559308b306b306f30$$ENDHEX$$
			$$HEX1$$7021$$ENDHEX$$) $$HEX8$$e130cb30e530fc306e300c30e87dc696$$ENDHEX$$(E)$$HEX5$$0d30d2210c3048515679$$ENDHEX$$^$$HEX22$$b930af30ea30d730c8309230e162355f0d306b30c130a730c330af304c306551633066304a308a304b306430$$ENDHEX$$
			$$HEX33$$0030997d7f6248516e30b930af30ea30d730c8304c300130b330e130f330c830823057304f306f304a52649655308c30663044308b30c55f81894c3042308b300230$$ENDHEX$$
			$$HEX37$$003000300c3048515679b930af30ea30d730c8309230e162355f0d306b30c130a730c330af304c3065516330663044306a30443068300130b330e130f330c83067304230633066308230$$ENDHEX$$
			$$HEX15$$0030997d7f6248516e30188af08f4c300a4ef8664d3055308c308b300230$$ENDHEX$$
			$$HEX38$$712109ff0c3048515679b930af30ea30d730c8309230e162355f0d306b30c130a730c330af304c306551633066304a308a304b306430997d7f6248516b308230188af08f4c3042308c307030$$ENDHEX$$
			$$HEX18$$003053306e30e65106748c5f0130997d7f6248514c309f5b4c8855308c308b305f308130$$ENDHEX$$Keyopen$$HEX1$$0130$$ENDHEX$$Buttonclicked$$HEX2$$67306f30$$ENDHEX$$2$$HEX7$$de56e65106744c309f5b4c885530$$ENDHEX$$
			$$HEX14$$00308c308b305f308130e86c0f614c30c55f8189673042308b300230$$ENDHEX$$
			
$$HEX4$$5c4f1062e5650900$$ENDHEX$$2004.01.07	jupiter	tada

$$HEX4$$f466b065e5650900$$ENDHEX$$
	
___/___/___/___/___/___/____/___/___/___/___/___/___/____/___/___/___/___/___/___/____/ */

string	ls_mod
string	ls_moji
string	ls_null

this.SetRow(row)

Choose Case	dwo.name
	/*------------------------------------------------------------------------------------
		$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_tanto"
		wf_button_clicked("$$HEX6$$c562535f0580b330fc30c930$$ENDHEX$$")
	Case	"cb_siire_tanto"
		wf_button_clicked("$$HEX8$$d54e6551c562535f0580b330fc30c930$$ENDHEX$$")
	Case	"cb_kakunin_tanto"
		wf_button_clicked("$$HEX8$$ba788d8ac562535f0580b330fc30c930$$ENDHEX$$")
	case "cb_kosin_tanto"
		wf_button_clicked("$$HEX8$$f466b065c562535f0580b330fc30c930$$ENDHEX$$")
	/*------------------------------------------------------------------------------------
		$$HEX5$$d730ed30b030e930e030$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	case	"cb_prog"
		wf_button_clicked("$$HEX5$$d730ed30b030e930e030$$ENDHEX$$")
		
	/*------------------------------------------------------------------------------------
		$$HEX4$$c154ee766a75f753$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_hin"
		wf_button_clicked("$$HEX4$$c154ee766a75f753$$ENDHEX$$")
	
	Case	"cb_hin_mae"
		wf_button_clicked("$$HEX7$$2f63ff664d52c154ee766a75f753$$ENDHEX$$")
	
	Case	"cb_hin_ato"
		wf_button_clicked("$$HEX7$$2f63ff668c5fc154ee766a75f753$$ENDHEX$$")
	
	Case	"cb_hin_oya"
		wf_button_clicked("$$HEX5$$aa89c154ee766a75f753$$ENDHEX$$")
		
	Case	"cb_hin_ko"
		wf_button_clicked("$$HEX5$$505bc154ee766a75f753$$ENDHEX$$")
		
	Case	"cb_hin_moto"
		wf_button_clicked("$$HEX7$$078999514351c154ee766a75f753$$ENDHEX$$")
		
	Case	"cb_hin_saki"
		wf_button_clicked("$$HEX7$$078999514851c154ee766a75f753$$ENDHEX$$")
		
	Case	"cb_s_hin"
		wf_button_clicked("$$HEX6$$8b95cb59c154ee766a75f753$$ENDHEX$$")
		
	Case	"cb_e_hin"
		wf_button_clicked("$$HEX6$$427d864ec154ee766a75f753$$ENDHEX$$")
		
	Case	"cb_hin_deki"		// mes_c08	$$HEX8$$506799657f4f2875cf91004ea7896888$$ENDHEX$$
		wf_button_clicked("$$HEX7$$fa516567d89ac154ee766a75f753$$ENDHEX$$")

	Case	"cb_sanshutu_hin"
		wf_button_clicked("$$HEX6$$2375fa51c154ee766a75f753$$ENDHEX$$")

	Case	"cb_tonyu_hin"
		wf_button_clicked("$$HEX6$$95626551c154ee766a75f753$$ENDHEX$$")
		
	Case	"cb_hin_taihi"
		wf_button_clicked("$$HEX6$$fe5bd46bc154ee766a75f753$$ENDHEX$$")
		
	Case	"cb_hin_sanshutu_1"
		wf_button_clicked("$$HEX9$$2375fa51ef53fd80c154ee766a75f75311ff$$ENDHEX$$")
		
	Case	"cb_hin_sanshutu_2"
		wf_button_clicked("$$HEX9$$2375fa51ef53fd80c154ee766a75f75312ff$$ENDHEX$$")
		
	Case	"cb_hin_sanshutu_3"
		wf_button_clicked("$$HEX9$$2375fa51ef53fd80c154ee766a75f75313ff$$ENDHEX$$")
		
	Case	"cb_hin_tounyu_1"
		wf_button_clicked("$$HEX9$$95626551ef53fd80c154ee766a75f75311ff$$ENDHEX$$")
		
	Case	"cb_hin_tounyu_2"
		wf_button_clicked("$$HEX9$$95626551ef53fd80c154ee766a75f75312ff$$ENDHEX$$")
		
	Case	"cb_hin_tounyu_3"
		wf_button_clicked("$$HEX9$$95626551ef53fd80c154ee766a75f75313ff$$ENDHEX$$")
		
	Case	"cb_hin_daigae"
		wf_button_clicked("$$HEX6$$e34eff66c154ee766a75f753$$ENDHEX$$")

	/*------------------------------------------------------------------------------------
		$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_tani"
		wf_button_clicked("$$HEX5$$58534d4fb330fc30c930$$ENDHEX$$")

	Case	"cb_tani_min"
		wf_button_clicked("$$HEX7$$00670f5c58534d4fb330fc30c930$$ENDHEX$$")
		
	Case	"cb_tani_mid"
		wf_button_clicked("$$HEX7$$2d4e939558534d4fb330fc30c930$$ENDHEX$$")
		
	Case	"cb_tani_max"
		wf_button_clicked("$$HEX7$$0067275958534d4fb330fc30c930$$ENDHEX$$")

	Case	"cb_tani_jyuryo"
		wf_button_clicked("$$HEX7$$cd91cf9158534d4fb330fc30c930$$ENDHEX$$")
		
	Case	"cb_tani_hattyu"
		wf_button_clicked("$$HEX7$$7a76e86c58534d4fb330fc30c930$$ENDHEX$$")
		
//	Case	"cb_tani_tanka"
//		wf_button_clicked("$$HEX7$$5853a14f58534d4fb330fc30c930$$ENDHEX$$")

	Case	"cb_tani_deki"			// mes_c08	$$HEX8$$506799657f4f2875cf91004ea7896888$$ENDHEX$$
		wf_button_clicked("$$HEX8$$fa516567d89a58534d4fb330fc30c930$$ENDHEX$$")
	
	Case	"cb_tani_tonyu"
		wf_button_clicked("$$HEX7$$9562655158534d4fb330fc30c930$$ENDHEX$$")
		
	Case	"cb_tani_kobai"
		wf_button_clicked("$$HEX7$$fc8cb78c58534d4fb330fc30c930$$ENDHEX$$")
	Case	"cb_tani_syohi"
		wf_button_clicked("$$HEX7$$886dbb8c58534d4fb330fc30c930$$ENDHEX$$")
		
	Case	"cb_tani_buturyu"
		wf_button_clicked("$$HEX7$$6972416d58534d4fb330fc30c930$$ENDHEX$$")
	
	/*------------------------------------------------------------------------------------
		$$HEX3$$d653155f4851$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_nouhin"					// $$HEX3$$0d7dc1544851$$ENDHEX$$
		wf_button_clicked("$$HEX6$$0d7dc1544851b330fc30c930$$ENDHEX$$")
		
	Case	"cb_buturyu"				// $$HEX5$$6972416db330fc30c930$$ENDHEX$$($$HEX12$$3b200d7dc154485168300c545830d5524d30923059308b30$$ENDHEX$$)
		wf_button_clicked("$$HEX5$$6972416db330fc30c930$$ENDHEX$$")	
		
	Case	"cb_siire"					// $$HEX3$$d54e65514851$$ENDHEX$$
		wf_button_clicked("$$HEX6$$d54e65514851b330fc30c930$$ENDHEX$$")
		
//	Case	"cb_nyuka"					// $$HEX3$$655177834851$$ENDHEX$$
//		wf_button_clicked("$$HEX6$$655177834851b330fc30c930$$ENDHEX$$")
		
	Case	"cb_soko"					// $$HEX2$$0950ab5e$$ENDHEX$$
		wf_button_clicked("$$HEX5$$0950ab5eb330fc30c930$$ENDHEX$$")
		
	Case	"cb_gaicyu"					// $$HEX3$$1659e86c4851$$ENDHEX$$
		wf_button_clicked("$$HEX6$$1659e86c4851b330fc30c930$$ENDHEX$$")
		
//	Case	"cb_nonyu_soko"			// $$HEX4$$0d7d65510950ab5e$$ENDHEX$$
//		wf_button_clicked("$$HEX7$$0d7d65510950ab5eb330fc30c930$$ENDHEX$$")
//
//	Case	"cb_torihiki"				//	$$HEX6$$d653155f4851b330fc30c930$$ENDHEX$$
//		wf_button_clicked("$$HEX6$$d653155f4851b330fc30c930$$ENDHEX$$")
//		
//	Case	"cb_torihiki_start"		// $$HEX8$$8b95cb59d653155f4851b330fc30c930$$ENDHEX$$
//		wf_button_clicked("$$HEX8$$8b95cb59d653155f4851b330fc30c930$$ENDHEX$$")
//		
//	Case	"cb_torihiki_end"			// $$HEX8$$427d864ed653155f4851b330fc30c930$$ENDHEX$$
//		wf_button_clicked("$$HEX8$$427d864ed653155f4851b330fc30c930$$ENDHEX$$")
//				
//	Case	"cb_syukko_saki_soko"	// $$HEX8$$fa51ab5e48510950ab5eb330fc30c930$$ENDHEX$$
//		wf_button_clicked("$$HEX8$$fa51ab5e48510950ab5eb330fc30c930$$ENDHEX$$")
//		
//	Case	"cb_syukko_moto_soko"	// $$HEX8$$fa51ab5e43510950ab5eb330fc30c930$$ENDHEX$$
//		wf_button_clicked("$$HEX8$$fa51ab5e43510950ab5eb330fc30c930$$ENDHEX$$")
//		
//	Case	"cb_ido_moto_soko"		// $$HEX8$$fb79d55243510950ab5eb330fc30c930$$ENDHEX$$
//		wf_button_clicked("$$HEX8$$fb79d55243510950ab5eb330fc30c930$$ENDHEX$$")
//		
	Case	"cb_ido_saki_soko"		// $$HEX8$$fb79d55248510950ab5eb330fc30c930$$ENDHEX$$
		wf_button_clicked("$$HEX8$$fb79d55248510950ab5eb330fc30c930$$ENDHEX$$")
//	
//	Case	"cb_nouhin_start"			// $$HEX9$$8b95cb590d7dc1544851b330fc30c9300900$$ENDHEX$$scm_t02	$$HEX5$$f2580a4ec696088a6888$$ENDHEX$$
//		wf_button_clicked("$$HEX8$$8b95cb590d7dc1544851b330fc30c930$$ENDHEX$$")
//		
//	Case	"cb_nouhin_end"			// $$HEX9$$427d864e0d7dc1544851b330fc30c9300900$$ENDHEX$$scm_t02	$$HEX5$$f2580a4ec696088a6888$$ENDHEX$$
//		wf_button_clicked("$$HEX8$$427d864e0d7dc1544851b330fc30c930$$ENDHEX$$")
////
//	Case	"cb_syuka_soko"			// $$HEX7$$fa5177830950ab5eb330fc30c930$$ENDHEX$$
//		wf_button_clicked("$$HEX7$$fa5177830950ab5eb330fc30c930$$ENDHEX$$")
//		
//	Case	"cb_hattyu"					// $$HEX7$$7a76e86c4851b330fc30c9300900$$ENDHEX$$scm_ed01
//		wf_button_clicked("$$HEX6$$7a76e86c4851b330fc30c930$$ENDHEX$$")
//
	Case	"cb_syuko_soko"					// $$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$
		wf_button_clicked("$$HEX7$$fa51ab5e0950ab5eb330fc30c930$$ENDHEX$$")
	Case	"cb_nyuko_soko"					// $$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$
		wf_button_clicked("$$HEX7$$6551ab5e0950ab5eb330fc30c930$$ENDHEX$$")
	
	/*------------------------------------------------------------------------------------
		$$HEX3$$fa517783bf4f$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_bin"
		wf_button_clicked("$$HEX4$$bf4fb330fc30c930$$ENDHEX$$")
		
	Case	"cb_syuka_bin"
		wf_button_clicked("$$HEX3$$fa517783bf4f$$ENDHEX$$")
		
	/*------------------------------------------------------------------------------------
		$$HEX4$$c1540d543a530652$$ENDHEX$$01$$HEX1$$5eff$$ENDHEX$$20
	------------------------------------------------------------------------------------*/
	Case	"cb_hinkubun01","cb_hinkubun02","cb_hinkubun03","cb_hinkubun04","cb_hinkubun05", &
			"cb_hinkubun06","cb_hinkubun07","cb_hinkubun08","cb_hinkubun09","cb_hinkubun10", &
			"cb_hinkubun11","cb_hinkubun12","cb_hinkubun13","cb_hinkubun14","cb_hinkubun15", &
			"cb_hinkubun16","cb_hinkubun17","cb_hinkubun18","cb_hinkubun19","cb_hinkubun20"
			
			Choose Case dwo.name
				Case "cb_hinkubun01"
					ls_moji = "$$HEX1$$11ff$$ENDHEX$$"
				Case "cb_hinkubun02"
					ls_moji = "$$HEX1$$12ff$$ENDHEX$$"
				Case "cb_hinkubun03"
					ls_moji = "$$HEX1$$13ff$$ENDHEX$$"
				Case "cb_hinkubun04"
					ls_moji = "$$HEX1$$14ff$$ENDHEX$$"
				Case "cb_hinkubun05"
					ls_moji = "$$HEX1$$15ff$$ENDHEX$$"
				Case "cb_hinkubun06"
					ls_moji = "$$HEX1$$16ff$$ENDHEX$$"
				Case "cb_hinkubun07"
					ls_moji = "$$HEX1$$17ff$$ENDHEX$$"
				Case "cb_hinkubun08"
					ls_moji = "$$HEX1$$18ff$$ENDHEX$$"
				Case "cb_hinkubun09"
					ls_moji = "$$HEX1$$19ff$$ENDHEX$$"
				Case "cb_hinkubun10"
					ls_moji = "$$HEX2$$11ff10ff$$ENDHEX$$"
				Case "cb_hinkubun11"
					ls_moji = "$$HEX2$$11ff11ff$$ENDHEX$$"
				Case "cb_hinkubun12"
					ls_moji = "$$HEX2$$11ff12ff$$ENDHEX$$"
				Case "cb_hinkubun13"
					ls_moji = "$$HEX2$$11ff13ff$$ENDHEX$$"
				Case "cb_hinkubun14"
					ls_moji = "$$HEX2$$11ff14ff$$ENDHEX$$"
				Case "cb_hinkubun15"
					ls_moji = "$$HEX2$$11ff15ff$$ENDHEX$$"
				Case "cb_hinkubun16"
					ls_moji = "$$HEX2$$11ff16ff$$ENDHEX$$"
				Case "cb_hinkubun17"
					ls_moji = "$$HEX2$$11ff17ff$$ENDHEX$$"
				Case "cb_hinkubun18"
					ls_moji = "$$HEX2$$11ff18ff$$ENDHEX$$"
				Case "cb_hinkubun19"
					ls_moji = "$$HEX2$$11ff19ff$$ENDHEX$$"
				Case "cb_hinkubun20"
					ls_moji = "$$HEX2$$12ff10ff$$ENDHEX$$"
			End Choose
			
			wf_button_clicked("$$HEX4$$c1540d543a530652$$ENDHEX$$" + ls_moji)
	/*------------------------------------------------------------------------------------
		$$HEX11$$d653bc8fd530a130a430eb3008ffd130b930d84e09ff$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_path"
		wf_button_clicked("$$HEX6$$d653bc8fd530a130a430eb30$$ENDHEX$$")
		
	/*------------------------------------------------------------------------------------
		$$HEX4$$ab30ca300d54f079$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_kana"
		wf_button_clicked("$$HEX4$$ab30ca300d54f079$$ENDHEX$$")
		
	/*------------------------------------------------------------------------------------
		$$HEX4$$d653155f3a530652$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_tkubun"
		wf_button_clicked("$$HEX4$$d653155f3a530652$$ENDHEX$$")

	Case	"cb_uriage_tkubun"
		wf_button_clicked("$$HEX6$$f2580a4ed653155f3a530652$$ENDHEX$$")
		
	Case	"cb_siire_tkubun"
		wf_button_clicked("$$HEX6$$d54e6551d653155f3a530652$$ENDHEX$$")
	/*------------------------------------------------------------------------------------
		$$HEX2$$06743175$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_riyu"
		wf_button_clicked("$$HEX5$$06743175b330fc30c930$$ENDHEX$$")
	/*------------------------------------------------------------------------------------
		$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_kamoku"
		wf_button_clicked("$$HEX5$$d179ee76b330fc30c930$$ENDHEX$$")
		
	/*------------------------------------------------------------------------------------
		$$HEX12$$bd30fc30c8306167f64e0130d530a330eb30bf306167f64e$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_sort", "cb_filter"

		SetNull(ls_null)

		Choose Case dwo.Name
			Case	"cb_sort"
				This.SetSort(ls_null)

			Case	"cb_filter"
				This.SetFilter(ls_null)
				This.Filter()

		End Choose

		This.Sort()
		This.GroupCalc()
		This.SetFocus()

//ADD-S 2007.1.24 mes_pu_dw$$HEX5$$88308a30b330d430fc30$$ENDHEX$$
	/*------------------------------------------------------------------------------------
		$$HEX12$$e55d0b7afb30e930a430f330fb30717d0854e930a430f330$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_koutei"
		wf_button_clicked("$$HEX5$$e55d0b7ab330fc30c930$$ENDHEX$$")
		
	Case	"cb_mae_koutei"
		wf_button_clicked("$$HEX6$$4d52e55d0b7ab330fc30c930$$ENDHEX$$")

	Case	"cb_line"
		wf_button_clicked("$$HEX6$$e930a430f330b330fc30c930$$ENDHEX$$")
		
	Case	"cb_aite_line"
		wf_button_clicked("$$HEX8$$f8764b62e930a430f330b330fc30c930$$ENDHEX$$")

	Case	"cb_togo_line"
		wf_button_clicked("$$HEX8$$717d0854e930a430f330b330fc30c930$$ENDHEX$$")
	
	/*------------------------------------------------------------------------------------
		$$HEX2$$06743175$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_riyu"
		wf_button_clicked("$$HEX5$$06743175b330fc30c930$$ENDHEX$$")
		
	Case	"cb_los_riyu"
		wf_button_clicked("$$HEX7$$ed30b93006743175b330fc30c930$$ENDHEX$$")

//ADD-E 2007.1.24
	/*------------------------------------------------------------------------------------
		$$HEX3$$c130fc30e030$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_team"
		wf_button_clicked("$$HEX6$$c130fc30e030b330fc30c930$$ENDHEX$$")
	Case	"cb_syuko_team"
		wf_button_clicked("$$HEX8$$fa51ab5ec130fc30e030b330fc30c930$$ENDHEX$$")
	Case	"cb_nyuko_team"
		wf_button_clicked("$$HEX8$$6551ab5ec130fc30e030b330fc30c930$$ENDHEX$$")
	Case	"cb_moto_team"
		wf_button_clicked("$$HEX7$$4351c130fc30e030b330fc30c930$$ENDHEX$$")
	Case	"cb_saki_team"
		wf_button_clicked("$$HEX7$$4851c130fc30e030b330fc30c930$$ENDHEX$$")

	/*------------------------------------------------------------------------------------
		$$HEX2$$e8908095$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_bumon"
		wf_button_clicked("$$HEX5$$e8908095b330fc30c930$$ENDHEX$$")
		
	Case	"cb_kojo_bumon"
		wf_button_clicked("$$HEX7$$e55d3458e8908095b330fc30c930$$ENDHEX$$")
		
	Case	"cb_kakari_bumon"
		wf_button_clicked("$$HEX6$$c24fe8908095b330fc30c930$$ENDHEX$$")
	
	Case	"cb_furikae_bumon"
		wf_button_clicked("$$HEX8$$2f63ff664851e8908095b330fc30c930$$ENDHEX$$")
		
	Case	"cb_syuko_bumon"
		wf_button_clicked("$$HEX9$$fa51ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$")
		
	Case	"cb_nyuko_bumon"
		wf_button_clicked("$$HEX9$$6551ab5ee55d3458e8908095b330fc30c930$$ENDHEX$$")
		
	Case	"cb_aite_bumon"
		wf_button_clicked("$$HEX7$$f8764b62e8908095b330fc30c930$$ENDHEX$$")
	
	Case	"cb_moto_bumon"
		wf_button_clicked("$$HEX8$$4351e55d3458e8908095b330fc30c930$$ENDHEX$$")
	
	Case	"cb_saki_bumon"
		wf_button_clicked("$$HEX8$$4851e55d3458e8908095b330fc30c930$$ENDHEX$$")
		
	Case	"cb_saki_kakari"
		wf_button_clicked("$$HEX6$$4851e8908095b330fc30c930$$ENDHEX$$")
	
	/*------------------------------------------------------------------------------------
		$$HEX4$$a430d930f330c830$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_event"
		wf_button_clicked("$$HEX7$$a430d930f330c830b330fc30c930$$ENDHEX$$")

	/*------------------------------------------------------------------------------------
		$$HEX1$$a47f$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_gun"
		wf_button_clicked("$$HEX4$$a47fb330fc30c930$$ENDHEX$$")

	/*------------------------------------------------------------------------------------
		$$HEX4$$8e96645c3a530652$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_kaiso_kbn"
		wf_button_clicked("$$HEX7$$8e96645cc1540d543a53065211ff$$ENDHEX$$")
		
	/*------------------------------------------------------------------------------------
		$$HEX4$$4d91e68cfa57966e$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_haifu"
		wf_button_clicked("$$HEX7$$4d91e68cfa57966eb330fc30c930$$ENDHEX$$")
		
	/*------------------------------------------------------------------------------------
		$$HEX2$$bb8cee76$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_himoku"
		wf_button_clicked("$$HEX5$$bb8cee76b330fc30c930$$ENDHEX$$")
		
	/*------------------------------------------------------------------------------------
		$$HEX2$$4655c154$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	Case	"cb_syohin"
		wf_button_clicked("$$HEX5$$4655c154b330fc30c930$$ENDHEX$$")
	/*-----------------------------------------------------------------------------------
		$$HEX4$$d730ea30f330bf30$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	case "cb_label"
		wf_button_clicked("$$HEX5$$e930d930e9306a75f753$$ENDHEX$$")
	case "cb_printer"
		wf_button_clicked("$$HEX6$$d730ea30f330bf306a75f753$$ENDHEX$$")
	
	/*-----------------------------------------------------------------------------------
		$$HEX2$$e452d952$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	case "cb_kinmu"
		wf_button_clicked("$$HEX5$$e452d952b330fc30c930$$ENDHEX$$")
		
	/*-----------------------------------------------------------------------------------
		$$HEX3$$21ff06525e98$$ENDHEX$$
	------------------------------------------------------------------------------------*/
	case "cb_a_bunrui"
		wf_button_clicked("$$HEX6$$41ff06525e98b330fc30c930$$ENDHEX$$")
	
	
End Choose

end event

event itemfocuschanged;This.SelectText(1,	256)
end event

event getfocus;com_pw_gparent	lw_w

lw_w	=	Parent_Window

lw_w.message_up("0")
end event

event itemerror;/*
	
	PB10$$HEX21$$65519b526167f64e47525590cd53a830e930fc30923068883a7955305b306a304430883046305f308130$$ENDHEX$$
	
	$$HEX2$$fe5bdc5f$$ENDHEX$$
	PBVer 10.2.1 C2$$HEX8$$0030ee4f636be230b830e530fc30eb30$$ENDHEX$$A
	
*/

date		ld_null
datetime	ldt_null
string	ls_column_name

ls_column_name	= dwo.name

SetNull(ld_null)
SetNull(ldt_null)

CHOOSE CASE dwo.coltype
	case	"date"
		this.setItem(row, ls_column_name, ld_null)
		
		return 3
	case	"datetime"
		this.setItem(row, ls_column_name, ldt_null)
		
		return 3
end choose
end event

