unit UnitPublic;
interface
uses Grids,StdCtrls,Dialogs,XMLDoc, xmldom, XMLIntf, msxmldom, Classes,windows,SysUtils;


//格式化JSON字符串
function formatJson(indent : string; inputStr : string) : string;
//格式化xml字符串
procedure formatXml(nTab:string; inStr:string; var outStr:string);
//将StringGrid的指定列值全更新为str
procedure setText2SG(sg: TStringGrid; acol : integer; str:string);
//将下拉框在指定格中显示
procedure setGridItem(cb : TComboBox; sg : TStringGrid; acol,arow:integer);
//给StringGrid编序列 (第0列)
procedure serialGrid(sg : TStringGrid);
//删除stringGrid中的某一行,后续的行向上整
procedure deleteRow(sg : TStringGrid);
//拷贝指定长度字符串,处理非ascii字符的问题
function my_copy(s :string; idx,len:integer):string;
//xsl转换
function transformXML(xmlstr: string; xslstr: string): WideString;
//字符串拆分, 根据subStr分隔符拆分字符串str ,支持分隔符为多字符的情况
function split(str,subStr:string):TStringList;
//utf8转换(相比delphi自带的方法,这个能有一定的容错能力)
function DecodeUtf8Str(const S:UTF8String): WideString;
//获取指定目录下的子目录（只取一级子目录）
function GetDirList(pPath: String): TStringList;

//
procedure setVer(v:string);
function getVer():string;

implementation

var
g_sVersion : string; //版本号

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
    //去掉换行回车符
    inStr := stringReplace(inStr,#13#10,'',[rfReplaceAll, rfIgnoreCase]);
    //去掉tab符
    inStr := stringReplace(inStr,#9,'',[rfReplaceAll, rfIgnoreCase]);

    outStr := '';
    indent := 0;
    iEnd := 0;
    isContent := false;
    while( inStr <> '' ) do
    begin
      isContent := false;
      idx := pos('<',inStr); //标签起始符
      if( idx<=0 ) then break;

      tmp := trim(copy(inStr,1,idx-1));
      if( (tmp <> '') ) then
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
            if(iEnd<=0)then break;
            iEnd := iEnd +1;
            indent := 0;
        end;
        '/': //结束标签  </tag>
        begin
            iEnd := pos('>',inStr);
            if(iEnd<=0)then break;
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
                break;

            iEnd := pos(tmp,inStr);
            if(iEnd<=0)then break;
            iEnd := iEnd+2;
        end;
        else //取完整标签 <tag>或<tag/>
        begin
            iEnd := pos('>',inStr);
            if(iEnd<=0)then break;
            sTag := trim(copy(inStr,1,iEnd));
            if( sTag[length(sTag)-1] ='/') then
            begin
                //独立标签 <tag/>
            end
            else
            begin
                //<tag></tag>情况
                tmp := Trim(copy(inStr, iEnd + 1, Length(inStr)));
                if '</' + copy(sTag, 2, Length(sTag)) = copy(tmp, 1, Length(sTag) + 1) then
                begin
                  sTag := sTag+'</' + copy(sTag, 2, Length(sTag));
                  inStr := sTag + trim(copy(tmp, iEnd + 2, Length(tmp)));
                  iEnd := Length(sTag);
                end
                else
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
    if(indent<>0)then
        showMessage('错误的XML格式');
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
  quot : integer; //双引号标记
  slant : integer; //反斜杠标记
  colon : integer; //冒号
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
  //去掉换行回车符
  inputStr := stringReplace(inputStr,#13#10,'',[rfReplaceAll, rfIgnoreCase]);
  //去掉tab符
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

  
  //json格式化处理
  //简易处理规则：
  //遇到反斜杠 "\"，输出，后面紧跟的字符直接输出，不做特殊处理
  //遇到双引号 """，输出，等待匹配下一个双引号（除了反斜杠"\"后的双引号外),其间的字符直接输出
  //遇到左花括号 "{" 缩进不变输出，回车，后续缩进等级+1
  //遇到右花括号 "}" 回车，缩进-1, 输出，后续缩进等级-1
  //遇到左方括号 "[" 缩进不变输出，回车，后续缩进等级+1
  //遇到右方括号 "]" 回车，缩进-1, 输出，后续缩进等级-1
  //遇到双引号外的逗号 "," 输出后回车
  //遇到冒号 ":", 输出，加一个空格
  //不符合以上规则的字符，除空格外，直接 输出
  //outStr := '';
  level := 0;
  quot := 0; //是否等待匹配双引号
  colon := 0;
  for i:=1 to length(inputStr) do
  begin
    c := inputStr[i];

    //outStr := outStr + c;
    if c<>' ' then s:=c else s:='';   //过滤一般性空格
    if (slant=1) then
    begin
      //反斜杠之后的字符直接输出
      slant := 0;
    end
    else if (quot = 1)  and (c <> '"') and (c<>'\') then
    begin
      //双引号之后的字符直接输出
      s := c; //双引号之间的空格也保留输出
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
