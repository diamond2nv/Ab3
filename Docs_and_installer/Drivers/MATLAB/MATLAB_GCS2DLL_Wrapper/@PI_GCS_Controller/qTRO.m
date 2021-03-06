function [iOutValues1] = qTRO(c,iValues1)
%function [iOutValues1] = qTRO(c,iValues1)
%PI MATLAB Class Library Version 1.1.1
% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

FunctionName = 'PI_qTRO';
if(any(strcmp(FunctionName,c.dllfunctions)))
	piValues1 = libpointer('int32Ptr',iValues1);
	iOutValues1 = zeros(size(iValues1));
	piOutValues1 = libpointer('int32Ptr',iOutValues1);
	nValues = length(iValues1);
	try
		[bRet,iValues1,iOutValues1] = calllib(c.libalias,FunctionName,c.ID,piValues1,piOutValues1,nValues);
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
