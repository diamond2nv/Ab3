function bRet = INI(c,szAxes)
% function bRet = INI(c,szAxes)
%PI MATLAB Class Library Version 1.1.1
% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'PI_INI';
if(any(strcmp(FunctionName,c.dllfunctions)))
	try
		[bRet,szAxes] = calllib(c.libalias,FunctionName,c.ID,szAxes);
		if(bRet==0)
			iError = GetError(c);
			szDesc = TranslateError(c,iError);
			error(szDesc);
		end
	catch
		rethrow(lasterror);
	end
else
	error('%s not found',FunctionName);
end
