unit BSC_sfdl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, OleCtrls, SHDocVw, ActiveX,
  ToolWin, Spin,BSC_SFDL_transaction, BSC_process_def, BSC_SFDL_process_step,
  BSC_SFDL_assign, BSC_SFDL_invoke, BSC_SFDL_desc, BSC_SFDL_if_else,
  BSC_SFDL_for_each, BSC_SFDL_exception, BSC_SFDL_with,BSC_SFDL_error;

type
  TFormSfdl = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    bbtn_clear: TBitBtn;
    BitBtn3: TBitBtn;
    bbtnXml: TBitBtn;
    Panel2: TPanel;
    web1: TWebBrowser;
    Panel3: TPanel;
    RichEditSfdl2: TRichEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Button1: TButton;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    sped_indent: TSpinEdit;
    StaticText1: TStaticText;
    pnl_btn: TPanel;
    rb_char: TRadioButton;
    rb_tab: TRadioButton;
    BitBtn2: TBitBtn;
    BitBtn19: TBitBtn;
    cbFunc: TComboBox;
    richeditsfdl: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtn_clearClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bbtnXmlClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure RichEditSfdl2Change(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rb_tabClick(Sender: TObject);
    procedure rb_charClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure cbFuncChange(Sender: TObject);
    procedure richeditsfdlChange(Sender: TObject);
    procedure richeditsfdlKeyPress(Sender: TObject; var Key: Char);
  private
  sfdl_transaction : Tsfdl_transaction;
  sfdl_process_def : Tsfdl_process_def;
  sfdl_process_step : Tsfdl_process_step;
  sfdl_assign : Tsfdl_assign;
  sfdl_invoke : Tsfdl_invoke;
  sfdl_description : Tsfdl_description;
  sfdl_for_each : Tsfdl_for_each;
  sfdl_exception : Tsfdl_exception;
  sfdl_if : TSfdl_if;
  sfdl_with : Tsfdl_with;
  sfdl_error : Tsfdl_error;
    { Private declarations }
    //在编辑区光标当前未知插入脚本
    //tag_type 是标签类型,0=双行标签，1=单行标签，
    procedure AddScript(tag_type :integer; tag, value : string);

    //整理脚本格式
    procedure doFormat();
//    procedure formatXml(nTab:integer; inStr:string; var outStr:string);

  public
    { Public declarations }
    //过程模板xml展示切换
    procedure showSfdl();
  end;

var
  FormSfdl: TFormSfdl;

implementation

uses UnitPublic;



{$R *.dfm}

procedure TFormSfdl.BitBtn1Click(Sender: TObject);
begin
    close;
end;

procedure TFormSfdl.bbtn_clearClick(Sender: TObject);
begin
    RichEditSfdl.Clear;
end;

procedure TFormSfdl.BitBtn3Click(Sender: TObject);
begin
    if bbtnXml.Tag=1 then exit;
  richeditsfdl.Text := '<?xml version="1.0" encoding="GBK"?> '
                            +chr(13)+chr(10)
+'<process_define name="BM_QueryUserInfo">'
                            +chr(13)+chr(10)
+'<description>查询用户信用等级(含信用度)信息</description>'
                            +chr(13)+chr(10)
+'<transaction timeout="60" type="TE">'
                            +chr(13)+chr(10)
+'<process_step name="step_1">'
                            +chr(13)+chr(10)
+'<assign from="10910002" to="ccs_fcgi.in.accept_in.order_content.order_type" />'
                            +chr(13)+chr(10)
+'<assign from="1" to="ccs_fcgi.in.accept_in.order_content.accept_seq" />'
                            +chr(13)+chr(10)
+'<assign from="in.operation_in.content"'
                            +chr(13)+chr(10)
+' to="ccs_fcgi.in.accept_in.order_content.order_req" />'
                            +chr(13)+chr(10)
+'<invoke id="ccs_fcgi" name="BM_QueryUserInfo" type="TE" />'
                            +chr(13)+chr(10)
+'</process_step>'
                            +chr(13)+chr(10)
+'</transaction>'
                            +chr(13)+chr(10)
+'<finish>'
                            +chr(13)+chr(10)
+'<for_each index="i" var="ccs_fcgi.out.accept_out.order_content.order_resp.credit_level_info.row">'
                            +chr(13)+chr(10)
+'<assign from="ccs_fcgi.out.accept_out.order_content.order_resp.user_info.row[i].bill_type"'
                            +chr(13)+chr(10)
+' to="out.operation_out.content.credit_info{i}.bill_type" />'
                            +chr(13)+chr(10)
+'<assign can_ignore="true" '
                            +chr(13)+chr(10)
+' from="ccs_fcgi.out.accept_out.order_content.order_resp.user_info.row[i].bill_credit"'
                            +chr(13)+chr(10)
+' to="out.operation_out.content.credit_info{i}.bill_credit" />'
                            +chr(13)+chr(10)
+'<assign from="ccs_fcgi.out.accept_out.order_content.order_resp.credit_level_info.row[i]"'
                            +chr(13)+chr(10)
+' to="out.operation_out.content.credit_level_info{i}" />'
                            +chr(13)+chr(10)
+'</for_each>'
                            +chr(13)+chr(10)
+'</finish>'
                            +chr(13)+chr(10)
+'</process_define>';

    doFormat();
end;

procedure TFormSfdl.bbtnXmlClick(Sender: TObject);
begin
    if bbtnXml.Tag=1 then
    begin
        bbtnXml.Tag :=0; //显示正常内容
        bbtnXml.Caption := 'XML(&X)';
    end
    else
    begin
        bbtnXml.Tag :=1; //显示xml内容
        bbtnXml.Caption := 'Text(&X)';
    end;
    showSfdl();
end;

procedure TFormSfdl.showSfdl();
var
    FileName : string;
begin
    if bbtnXml.Tag=0 then //显示文本
    begin
        panel3.Visible := true;
        panel2.visible := false;
        panel3.align := alClient;
        richEditsfdl.Align := alClient;
        pnl_btn.Enabled := true;
        bbtn_clear.Enabled := true;
    end
    else
    begin   //显示xml
        pnl_btn.Enabled := false;
        bbtn_clear.Enabled := false;
        panel3.Visible := false;
        panel2.visible := true;
        panel2.align := alClient;
        web1.Align := alClient;
        FileName := ExtractFilePath(Application.ExeName)+'bsccfg_xml_tmp.xml';
        richeditSfdl.Lines.SaveToFile(FileName);
        web1.Navigate(FileName);
    end;
end;

procedure TFormSfdl.FormCreate(Sender: TObject);
begin
  web1.Navigate('about:blank');

  sfdl_transaction := Tsfdl_transaction.Create(nil);
  sfdl_process_def := Tsfdl_process_def.Create(nil);
  sfdl_process_step := Tsfdl_process_step.Create(nil);
  sfdl_assign := Tsfdl_assign.Create(nil);
  sfdl_invoke := Tsfdl_invoke.Create(nil);
  sfdl_description := Tsfdl_description.Create(nil);
  sfdl_for_each := Tsfdl_for_each.Create(nil);
  sfdl_exception := Tsfdl_exception.Create(nil);
  sfdl_if := Tsfdl_if.Create(nil);
  sfdl_with := Tsfdl_with.Create(nil);
  sfdl_error:=Tsfdl_error.create(nil);
end;
procedure TFormSfdl.FormDestroy(Sender: TObject);
begin
  sfdl_transaction.Free;
  sfdl_process_def.Free;
  sfdl_process_step.Free;
  sfdl_assign.Free;
  sfdl_invoke.Free;
  sfdl_description.Free;
  sfdl_for_each.Free;
  sfdl_exception.Free;
  sfdl_if.Free;
  sfdl_with.Free;
  sfdl_error.Free;
end;

procedure TFormSfdl.BitBtn5Click(Sender: TObject);
var
    s : string;
begin
    if( sfdl_transaction.ShowModal = mrOK ) then
    begin
        s := ' timeout="'+inttostr(sfdl_transaction.sped_timeout.value)+'" type="'+sfdl_transaction.cb_type.Text+'"';
        AddScript(0, 'transaction', s);
    {
        s := '<transaction timeout="'+inttostr(sfdl_transaction.sped_timeout.value)+'" type="'+sfdl_transaction.cb_type.Text+'" >'+#13#10;
//showmessage( 'sel start='+inttostr(     richeditsfdl.SelStart) + ' sel length='+ inttostr(richeditsfdl.sellength));
                richeditSfdl.SelText := s;
                richeditSfdl.Tag := richeditSfdl.SelStart;
                s := #13#10'</transaction>'+#13#10;
                richeditSfdl.SelText := s;
                richeditSfdl.SelStart := richeditSfdl.Tag;
     }
    end;
end;

procedure TFormSfdl.BitBtn13Click(Sender: TObject);
var
        s: string;
begin
        sfdl_process_def.ed_process_def.Clear;
        if( sfdl_process_def.ShowModal = mrOk ) then
        begin
                richeditSfdl.SelText := '<?xml version="1.0" encoding="GBK"?> ' +#13#10;
                s := 'name="' + sfdl_process_def.ed_process_def.Text + '"';
                addScript(0,'process_define', s);
        end;
end;

procedure TFormSfdl.BitBtn6Click(Sender: TObject);
var
        s: string;
begin
        sfdl_process_step.ed_process_step.Clear;
        if( sfdl_process_step.ShowModal = mrOk ) then
        begin
                s := 'name="' + sfdl_process_step.ed_process_step.Text +'"'  ;
                addScript(0, 'process_step', s);
        end;
end;

procedure TFormSfdl.BitBtn7Click(Sender: TObject);
begin
        addScript(0,'finish','');
end;

procedure TFormSfdl.BitBtn8Click(Sender: TObject);
var
        s: string;
begin
    sfdl_assign.cb_assign_ignore.Text := 'false';
    sfdl_assign.ed_assign_from.Clear;
    sfdl_assign.ed_assign_to.Clear;
    if( sfdl_assign.ShowModal = mrOk ) then
    begin
        s := 'can_ignore="' + sfdl_assign.cb_assign_ignore.Text + '" from="' + sfdl_assign.ed_assign_from.Text +  '" to="' +sfdl_assign.ed_assign_to.Text +'"';
        addScript(1,'assign',s);
    end;
    end;

procedure TFormSfdl.BitBtn11Click(Sender: TObject);
var
        s : string;
begin
        sfdl_invoke.ed_invoke_id.Clear;
        if( sfdl_invoke.ShowModal = mrOK ) then
        begin
                s := 'id="' + sfdl_invoke.ed_invoke_id.Text
                +'" name="' + sfdl_invoke.ed_name.text
                +'" type="' + sfdl_invoke.cb_invoke_type.Text
                +'" exception="' + sfdl_invoke.cb_invoke_exception.Text + '"';

                if( sfdl_invoke.cb_record_accept_detail.checked ) then
                begin
                    s := s+ ' record_accept_detail="true"';
                end;

                if( sfdl_invoke.cb_invoke_type.Text = 'TUXEDO' ) then
                begin
                        s := s+ ' call_flag="' + sfdl_invoke.cb_invoke_flag.Text + '"' ;
                end ;

                addScript(1,'invoke',s);
        end;
end;

procedure TFormSfdl.BitBtn14Click(Sender: TObject);
var
        s : string;
begin
        sfdl_description.ed_description.Clear;
        if( sfdl_description.ShowModal = mrOK ) then
        begin
                s := '<description>' + sfdl_description.ed_description.Text + '</description>' + #13#10;
                richeditSfdl.SelText := s;
        end;
end;

procedure TFormSfdl.BitBtn12Click(Sender: TObject);
begin
        addScript(0,'body','');
end;

procedure TFormSfdl.BitBtn4Click(Sender: TObject);
var
        s : string;
begin
        sfdl_if.ed_condition.Clear;
        if( sfdl_if.ShowModal = mrOK ) then
        begin
                s := 'condition="' + sfdl_if.ed_condition.Text + '"';
                addScript(0,'if',s);
                addScript(0,'body','');
        end;
end;

procedure TFormSfdl.Button1Click(Sender: TObject);
begin
        addScript(0,'else','');
        addScript(0,'body','');
end;

procedure TFormSfdl.BitBtn9Click(Sender: TObject);
var
        s : string;
begin
        sfdl_if.ed_condition.Clear;
        if( sfdl_if.ShowModal = mrOK ) then
        begin
                s := 'condition="' + sfdl_if.ed_condition.Text + '"' ;
                addScript(0,'elseif',s);
                addScript(0,'body','');
        end;
end;

procedure TFormSfdl.BitBtn15Click(Sender: TObject);
var
        s : string;
begin
//        sfdl_for_each.ed_for_index.Clear;
        sfdl_for_each.ed_for_var.Clear;
        if( sfdl_for_each.ShowModal = mrOK ) then
        begin
                s := 'index="' + sfdl_for_each.ed_for_index.Text + '" var="' + sfdl_for_each.ed_for_var.Text + '"';
                addScript(0,'for_each',s);
        end;
end;

procedure TFormSfdl.BitBtn16Click(Sender: TObject);
begin
      addScript(1,'break','');
end;

procedure TFormSfdl.BitBtn17Click(Sender: TObject);
begin
      addScript(1,'continue','');
end;

procedure TFormSfdl.BitBtn10Click(Sender: TObject);
var
    s : string;
begin
    sfdl_exception.ed_errmsg.text := '';
    sfdl_exception.ed_errclass.text := '';
    sfdl_exception.ed_errcode.text := '';
    if( sfdl_exception.ShowModal = mrOK ) then
    begin
        with sfdl_exception do
        begin
            s := 'err_code="'+ed_errcode.text+'" err_class="'+ed_errclass.text+'" err_msg="'+ed_errmsg.text+'"';

        end;
        addScript(1,'exception',s);
    end;
end;

procedure TFormSfdl.RichEditSfdl2Change(Sender: TObject);
begin
//showmessage('on change');
    if Showing  and (bbtnXml.Tag = 1) then
        RichEditSfdl.SetFocus;
end;

//在编辑区光标当前未知插入脚本
//tag_type 是标签类型,0=双行标签，1=单行标签，
procedure TFormSfdl.AddScript(tag_type :integer; tag, value : string);
var
    s : string;
begin
    if value='' then
        s := '<'+tag
    else
        s := '<'+tag+' '+value;
    case ( tag_type  ) of
    0:
    begin
        s := s+'>'+#13#10;
        RichEditSfdl.SelText := s;
        richeditSfdl.Tag := richeditSfdl.SelStart;
        s := #13#10+'</'+tag+'>' + #13#10;
        richeditSfdl.SelText := s;
        richeditSfdl.SelStart := richeditSfdl.Tag;

    end;
    1:
    begin
        s := s+'/>'+#13#10;
        richeditSfdl.SelText := s;
    end;
    end;
    richeditSfdl.SetFocus;
end;

procedure TFormSfdl.BitBtn18Click(Sender: TObject);
begin
    doFormat();
end;

procedure TFormSfdl.doFormat();
var
    outStr : string;
    tab : string;
    j : integer;
begin
    for j:=1 to sped_indent.Value do
    begin
        if(rb_char.Checked)then
            tab := tab+' '
        else
          tab := tab+chr(9);
    end;
    formatXml(tab, richeditsfdl.Lines.Text, outStr);
    richeditsfdl.Lines.Text := outStr;
end;
{
procedure TFormSfdl.formatXml(nTab:integer; inStr:string; var outStr:string);
var
    //nTab : integer;
    sTag,tmp : string;
    idx,indent,currLevel,nextLevel,iEnd : integer;
    isContent :boolean;
    function getTab(level:integer): string;
    var
      tab : string;
      j : integer;
    begin
      getTab := '';
      for j:=1 to nTab*level do
      begin
        if(rb_char.Checked)then
            tab := tab+' '
        else
          tab := tab+chr(9);
      end;
      result := tab;
    end;
begin
    //去掉换行回车符
    inStr := stringReplace(inStr,#13#10,'',[rfReplaceAll, rfIgnoreCase]);
    //去掉tab符
    inStr := stringReplace(inStr,#9,'',[rfReplaceAll, rfIgnoreCase]);

    //nTab :=  strToInt(ed_tab.Text);
    //
    outStr := '';
    indent := 0;
    isContent := false;
    while( inStr <> '' ) do
    begin

      idx := pos('<',inStr); //标签起始符
      if( idx<=0 ) then exit;

      tmp := trim(copy(inStr,1,idx-1));
      if( tmp <> '') then
      begin
        //标签之间的内容,不换行,不缩进
        //outStr := outStr + getTab(indent)+trim(copy(inStr,1,idx-1))+#13#10;
        outStr := outStr + trim(copy(inStr,1,idx-1));
        isContent := true;
      end
      else
      begin
        outStr := outStr+#13#10;
      end;
      inStr := trim(copy(inStr,idx,length(inStr)));

      currLevel := 0;
      nextLevel := 0;
      //取完整标签
      case( inStr[2] )of
        '?': //xml起始 <?xml ... ?>
        begin
            iEnd := pos('?>',inStr);
            if(iEnd<=0)then exit;
            iEnd := iEnd +1;
            indent := 0;
        end;
        '/': //结束标签  </tag>
        begin
            iEnd := pos('>',inStr);
            if(iEnd<=0)then exit;
            currLevel := -1;  //当前递减一层
        end;
        '!': //注释  <!-- abc -->  或 <![CDATA[ ASDF ]]>
        begin
            if( inStr[3]='-' ) then
            begin
                tmp := '-->';
            end
            else if (inStr[3]='[') then
            begin
                tmp := ']]>';
            end
            else
                exit;

            iEnd := pos(tmp,inStr);
            if(iEnd<=0)then exit;
            iEnd := iEnd+2;
        end;
        else //取完整标签 <tag>或<tag/>
        begin
            iEnd := pos('>',inStr);
            if(iEnd<=0)then exit;
            sTag := trim(copy(inStr,1,iEnd));
            if( sTag[length(sTag)-1] ='/') then
            begin
                //独立标签 <tag/>
            end
            else
            begin
                //以上情况都不是,则当前标签是正常标签
                nextLevel := 1; //下一层缩进一层
            end;
        end;
      end;

      //处理
      sTag := trim(copy(inStr,1,iEnd));
      inStr := trim(copy(inStr,iEnd+1,length(inStr)));
      indent := indent + currLevel;
      if( not isContent )then
      begin
        outStr := outStr+getTab(indent);
      end
      else
        isContent := false;
      outStr := outStr+sTag;
      indent := indent + nextLevel;

    end;

    //
    outStr := copy(outStr, 3, length(outStr)-2);
end;
}

procedure TFormSfdl.rb_tabClick(Sender: TObject);
begin
    sped_indent.Text := '1';
end;

procedure TFormSfdl.rb_charClick(Sender: TObject);
begin
    sped_indent.Text := '2';
end;

procedure TFormSfdl.BitBtn2Click(Sender: TObject);
var
        s : string;
begin
        //sfdl_with.ed_from.Clear;
        if( sfdl_with.ShowModal = mrOK ) then
        begin
                s := 'from="' + sfdl_with.ed_from.Text + '" to="'+sfdl_with.ed_to.text+'"';
                addScript(0,'with',s);
                //addScript(0,'body','');
        end;
end;

procedure TFormSfdl.BitBtn19Click(Sender: TObject);
var
    s : string;
begin
    sfdl_error.ed_errmsg.text := '';
    sfdl_error.ed_errclass.text := '';
    sfdl_error.ed_errcode.text := '';
    if( sfdl_error.ShowModal = mrOK ) then
    begin
        with sfdl_error do
        begin
            s := 'err_code="'+ed_errcode.text+'" err_class="'+ed_errclass.text+'" err_msg="`'+ed_errmsg.text+'`"';

        end;
        addScript(1,'error',s);
    end;

end;

procedure TFormSfdl.cbFuncChange(Sender: TObject);
begin
    RichEditSfdl.SelText := cbFunc.Items.Strings[cbFunc.itemindex];
    richEditsfdl.SetFocus;
    cbFunc.ItemIndex := 0;
end;

procedure TFormSfdl.richeditsfdlChange(Sender: TObject);
begin
    if Showing  and (bbtnXml.Tag = 1) then
        RichEditSfdl.SetFocus;
end;

procedure TFormSfdl.richeditsfdlKeyPress(Sender: TObject; var Key: Char);
begin
    if( key = #1 ) then
        TMemo(sender).SelectAll;
end;

end.
