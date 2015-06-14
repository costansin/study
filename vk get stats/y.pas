program yy;
{$mode delphi}
uses SysUtils;
var s:string;
i: Longint;
begin
	AssignFile(input,'out.txt');
	AssignFile(output,'ou.txt');
  reset(input);
	rewrite(output);
	while not(eof) do
	begin
		Readln(s);
		if (length(s)>0)and(s[1]='h') then
		begin
			for i:=1 to length(s) do
			begin
				if s[i]='#' then Write(^I) else
				if s[i]<>'<' then Write(s[i])
				else break;
			end;
			Writeln;
		end;
	end;
end.
