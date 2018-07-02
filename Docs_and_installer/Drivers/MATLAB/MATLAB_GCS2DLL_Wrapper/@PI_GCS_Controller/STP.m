function [iRet] = STP(c)
%function [iRet] = STP(c)
%PI MATLAB Class Library Version 1.1.1
% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

FunctionName = 'PI_STP';
if(any(strcmp(FunctionName,c.dllfunctions)))
	try
		[iRet] = calllib(c.libalias,FunctionName,c.ID);
	catch
		rethrow(lasterror);
	end
else
	error('%s not found',FunctionName);
end
