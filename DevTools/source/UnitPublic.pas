unit UnitPublic;
interface
uses Grids,StdCtrls,Dialogs,XMLDoc, xmldom, XMLIntf, msxmldom, Classes,windows,SysUtils;


//��ʽ��JSON�ַ���
function formatJson(indent : string; inputStr : string) : string;
//��ʽ��xml�ַ���
procedure formatXml(nTab:string; inStr:string; var outStr:string);
//��StringGrid��ָ����ֵȫ����Ϊstr
procedure setText2SG(sg: TStringGrid; acol : integer; str:string);
//����������ָ��������ʾ
procedure setGridItem(cb : TComboBox; sg : TStringGrid; acol,arow:integer);
//��StringGrid������ (��0��)
procedure serialGrid(sg : TStringGrid);
//ɾ��stringGrid�е�ĳһ��,��������������
procedure deleteRow(sg : TStringGrid);
//����ָ�������ַ���,�����ascii�ַ�������
function my_copy(s :string; idx,len:integer):string;
//xslת��
function transformXML(xmlstr: string; xslstr: string): WideString;
//�ַ������, ����subStr�ָ�������ַ���str ,֧�ַָ���Ϊ���ַ������
function split(str,subStr:string):TStringList;
//utf8ת��(���delphi�Դ��ķ���,�������һ�����ݴ�����)
function DecodeUtf8Str(const S:UTF8String): WideString;
//��ȡָ��Ŀ¼�µ���Ŀ¼��ֻȡһ����Ŀ¼��
function GetDirList(pPath: String): TStringList;

//
procedure setVer(v:string);
function getVer():string;

implementation

var
g_sVersion : string; //�汾��

procedure setVer(v:string);
begin
  g_sVersion := v;
end;
function getVer():string;
begin
  result := g_sVersion;
end;

function DecodeUtf8Str(const S:UTF8String): WideString;
var lenSrc,lenDst  : Integer;
begin
  lenSrc  := Length(S);
  if(lenSrc=0)then Exit;
  lenDst  := MultiByteToWideChar(CP_UTF8, 0, Pointer(S),lenSrc, nil, 0);
  SetLength(Result, lenDst);
  MultiByteToWideChar(CP_UTF8, 0, Pointer(S),lenSrc, Pointer(Result), lenDst);
end;

function split(str,subStr:string):TStringList;
begin
  Result:=TStringList.Create;
  while Pos(subStr,str)>0 do
  begin
    Result.Add(trim(Copy(str,1,Pos(subStr,str)-1)));
    Delete(str,1,Pos(subStr,str));
  end;
  Result.Add(str);
end;


function my_copy(s :string; idx,len:integer):string;
var
    i,m,k : integer;
begin
    if( (length(s)-idx+1)<=len )then
    begin
        result := copy(s,idx,len);
    end
    else
    begin
        m:=idx+len-1;
        k:=0;
        for i:=idx to m do
        begin
            if (s[i]>=#128) then
            begin
                k := 1-k;
            end;
        end;
        result := copy(s,idx,len-k);
    end;
end;

procedure deleteRow(sg : TStringGrid);
var
    i : integer;
begin
    with sg do
    begin
        if (row<1) then exit;
        for i:= row to RowCount-2 do
        begin
            Rows[i] := Rows[i+1];
        end;
        if RowCount > 2 then
        begin
            RowCount := RowCount - 1;
        end
        else
        begin
            rows[rowcount-1].text := '';
        end;
    end;
end;

procedure serialGrid(sg : TStringGrid);
var
    i : integer;
begin
    for i:= 1 to sg.RowCount-1 do
        sg.Cells[0,i] := inttostr(i);
end;


procedure setGridItem(cb : TComboBox; sg : TStringGrid; acol,arow:integer);
begin
        cb.left :=  sg.cellrect(acol,arow).left+1;
        cb.top :=  sg.top + sg.cellrect(acol,arow).top+1;
        cb.width := sg.colwidths[acol];
        cb.height := sg.rowheights[arow];
        cb.Text := sg.cells[acol,arow];
        cb.Show;
        cb.SetFocus;
end;

procedure setText2SG(sg: TStringGrid; acol : integer; str:string);
var
    i : integer;
begin
    for i:=1 to sg.rowcount-1 do
    begin
        sg.cells[acol,i] := str;
    end;
end;

procedure formatXml(nTab:string; inStr:string; var outStr:string);
var

    sTag,tmp : string;
    idx,indent,currLevel,nextLevel,iEnd : integer;
    isContent :boolean;

    function getTab(level:integer): string;
    var
      tab : string;
      j : integer;
    begin
      getTab := '';
      for j:=1 to level do
      begin
        tab := tab+nTab;
      end;
      result := tab;
    end;
begin
    //ȥ�����лس���
    inStr := stringReplace(inStr,#13#10,'',[rfReplaceAll, rfIgnoreCase]);
    //ȥ��tab��
    inStr := stringReplace(inStr,#9,'',[rfReplaceAll, rfIgnoreCase]);

    outStr := '';
    indent := 0;
    iEnd := 0;
    isContent := false;
    while( inStr <> '' ) do
    begin
      isContent := false;
      idx := pos('<',inStr); //��ǩ��ʼ��
      if( idx<=0 ) then break;

      tmp := trim(copy(inStr,1,idx-1));
      if( (tmp <> '') ) then
      begin
        //��ǩ֮�������,������,������
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
      //ȡ������ǩ
      case( inStr[2] )of
        '?': //xml��ʼ <?xml ... ?>
        begin
            iEnd := pos('?>',inStr);
            if(iEnd<=0)then break;
            iEnd := iEnd +1;
            indent := 0;
        end;
        '/': //������ǩ  </tag>
        begin
            iEnd := pos('>',inStr);
            if(iEnd<=0)then break;
            currLevel := -1;  //��ǰ�ݼ�һ��
        end;
        '!': //ע��  <!-- abc -->  �� <![CDATA[ ASDF ]]>
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
                break;

            iEnd := pos(tmp,inStr);
            if(iEnd<=0)then break;
            iEnd := iEnd+2;
        end;
        else //ȡ������ǩ <tag>��<tag/>
        begin
            iEnd := pos('>',inStr);
            if(iEnd<=0)then break;
            sTag := trim(copy(inStr,1,iEnd));
            if( sTag[length(sTag)-1] ='/') then
            begin
                //������ǩ <tag/>
            end
            else
            begin
                //<tag></tag>���
                tmp := Trim(copy(inStr, iEnd + 1, Length(inStr)));
                if '</' + copy(sTag, 2, Length(sTag)) = copy(tmp, 1, Length(sTag) + 1) then
                begin
                  sTag := sTag+'</' + copy(sTag, 2, Length(sTag));
                  inStr := sTag + trim(copy(tmp, iEnd + 2, Length(tmp)));
                  iEnd := Length(sTag);
                end
                else
                   //�������������,��ǰ��ǩ��������ǩ
                   nextLevel := 1; //��һ������һ��
            end;
        end;
      end;

      //����
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
    if(indent<>0)then
        showMessage('�����XML��ʽ');
    if(copy(outStr, 1, 2)=#13#10)then
        outStr := copy(outStr, 3, length(outStr)-2);
end;
function transformXML(xmlstr: string; xslstr: string): WideString;
var
  xmldoc : iXMLDocument;
  xsldoc : iXMLDocument;
  tmpdoc : IXMLDocument;
  txt : WideString;
begin
  xmldoc := LoadXMLData(xmlstr);
  xsldoc := LoadXMLData(xslstr);
  xmldoc.DocumentElement.TransformNode(xsldoc.DocumentElement, txt);
  tmpdoc := LoadXMLData(txt);
  //tmpdoc.Encoding:='GBK';
  tmpdoc.SetEncoding('GBK');
  tmpdoc.savetoxml(result);
end;

function formatJson(indent : string; inputStr : string) : string;
var
  outStr,s : string;
  p,i : integer;
  c : char;
  level : integer;
  quot : integer; //˫���ű��
  slant : integer; //��б�ܱ��
  colon : integer; //ð��
  function getTab(level : integer):string;
  var
    tab : string;
    j : integer;
  begin
    getTab := '';
    if level > 0 then
    begin
    for j:=1 to level do
    begin
      tab := tab + indent;
    end;
    end;
    result := tab;
  end;
begin
  //ȥ�����лس���
  inputStr := stringReplace(inputStr,#13#10,'',[rfReplaceAll, rfIgnoreCase]);
  //ȥ��tab��
  inputStr := stringReplace(inputStr,#9,'',[rfReplaceAll, rfIgnoreCase]);
  p := pos('{',inputStr);
  if p>0 then
  begin
    outStr := copy(inputStr,1,p-1);
    inputStr := copy(inputStr,p,length(inputStr));
  end
  else
  begin
    result := inputStr;
    exit;
  end;

  
  //json��ʽ������
  //���״������
  //������б�� "\"�����������������ַ�ֱ��������������⴦��
  //����˫���� """��������ȴ�ƥ����һ��˫���ţ����˷�б��"\"���˫������),�����ַ�ֱ�����
  //���������� "{" ��������������س������������ȼ�+1
  //�����һ����� "}" �س�������-1, ��������������ȼ�-1
  //���������� "[" ��������������س������������ȼ�+1
  //�����ҷ����� "]" �س�������-1, ��������������ȼ�-1
  //����˫������Ķ��� "," �����س�
  //����ð�� ":", �������һ���ո�
  //���������Ϲ�����ַ������ո��⣬ֱ�� ���
  //outStr := '';
  level := 0;
  quot := 0; //�Ƿ�ȴ�ƥ��˫����
  colon := 0;
  for i:=1 to length(inputStr) do
  begin
    c := inputStr[i];

    //outStr := outStr + c;
    if c<>' ' then s:=c else s:='';   //����һ���Կո�
    if (slant=1) then
    begin
      //��б��֮����ַ�ֱ�����
      slant := 0;
    end
    else if (quot = 1)  and (c <> '"') and (c<>'\') then
    begin
      //˫����֮����ַ�ֱ�����
      s := c; //˫����֮��Ŀո�Ҳ�������
    end
    else

    begin
     case c of
      '\': begin
        slant := 1;
        end;
      '{': begin
        if colon <> 1 then s:=getTab(level) + s ;
        s := s + #13#10 ;
        level:=level+1;
        colon := 0;
        end;
      '}': begin
        s := #13#10 + getTab(level-1) + s;
        level:=level-1;
        end;
      '[': begin
        if colon <> 1 then s:=getTab(level) + s ;
        s := s + #13#10 ;
        level:=level+1;
        colon := 0;
        end;
      ']': begin
        s := #13#10 + getTab(level-1) + s;
        level:=level-1;
        end;
      '"': begin
        quot := 1 - quot;
        if  (quot=1) and (colon =0 ) then  s := getTab(level) + s;
        colon := 0;
        end;
      ',': begin
        s := s + #13#10 ;
        colon := 0;
        end;
      ':': begin
        s := s + ' ' ;
        colon := 1;
        end;
     else
      //
     end ;

    end;
    outStr := outStr + s;
  end;

  result := outStr;
end;

function GetDirList(pPath: String): TStringList;
var
  SearchRec:TSearchRec;
  i:Integer;
  lStringList:TStringList;
  TempPath:string;
begin
  lStringList:=TStringList.Create;
  TempPath:=pPath+'\*.*';
  i:=FindFirst(TempPath,faDirectory,SearchRec);
  while i=0 do
  begin
    if SearchRec.Attr=16 then
    begin
      if (SearchRec.Name<>'.') and(SearchRec.Name<>'..') then
        lStringList.Add(SearchRec.Name);
    end;
    i:= FindNext(SearchRec);
  end;
  FindClose(SearchRec);
  Result:=lStringList;
end;


end.
