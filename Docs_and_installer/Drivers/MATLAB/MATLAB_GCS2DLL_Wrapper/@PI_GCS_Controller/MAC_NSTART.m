function [bRet] = MAC_NSTART(c,szMacroName,nTimes)
%function [bRet] = MAC_NSTART(c,szMacroName,nTimes)
%PI MATLAB Class Library Version 1.1.1
% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'PI_MAC_NSTART';
if(any(strcmp(FunctionName,c.dllfunctions)))
	try
		[bRet,szMacroName] = calllib(c.libalias,FunctionName,c.ID,szMacroName,nTimes);
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
