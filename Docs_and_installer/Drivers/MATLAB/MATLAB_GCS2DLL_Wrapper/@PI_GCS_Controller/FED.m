function [bRet] = FED(c,szAxes,iInValues1,iInValues2)
%function [bRet] = FED(c,szAxes,iInValues1,iInValues2)
%PI MATLAB Class Library Version 1.1.1
% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'PI_FED';
if(any(strcmp(FunctionName,c.dllfunctions)))
	piInValues1 = libpointer('int32Ptr',iInValues1);
	piInValues2 = libpointer('int32Ptr',iInValues2);
	try
		[bRet,szAxes,iInValues1,iInValues2] = calllib(c.libalias,FunctionName,c.ID,szAxes,piInValues1,piInValues2);
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
