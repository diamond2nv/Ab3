function [iOutValues1] = IsRunningMacro(c)
%function [iOutValues1] = IsRunningMacro(c)
%PI MATLAB Class Library Version 1.1.1
% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'PI_IsRunningMacro';
if(any(strcmp(FunctionName,c.dllfunctions)))
	iOutValues1 = zeros(1);
	piOutValues1 = libpointer('int32Ptr',iOutValues1);
	try
		[bRet,iOutValues1] = calllib(c.libalias,FunctionName,c.ID,piOutValues1);
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
