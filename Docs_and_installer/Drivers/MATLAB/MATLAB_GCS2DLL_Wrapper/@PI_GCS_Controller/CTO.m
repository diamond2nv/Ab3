function [bRet] = CTO(c,iValues1,iValues2,dValues,nValues)
%function [bRet] = CTO(c)
%PI MATLAB Class Library Version 1.1.1
% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'PI_CTO';
if(any(strcmp(FunctionName,c.dllfunctions)))
	piValues = libpointer('int32Ptr',iValues1);
	piValues1 = libpointer('int32Ptr',iValues2);
	pdValues = libpointer('doublePtr',dValues);
	nValues = length(iValues1);
	try
		[bRet,iValues,iValues2,dValues] = calllib(c.libalias,FunctionName,c.ID,piValues,piValues1,pdValues,nValues);
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
