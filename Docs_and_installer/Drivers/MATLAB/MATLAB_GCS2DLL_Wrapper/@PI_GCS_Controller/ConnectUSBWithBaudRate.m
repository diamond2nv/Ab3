function c = ConnectUSBWithBaudRate(c,szHostName,nPort)
%function c = ConnectUSBWithBaudRate(c,szHostName,nPort)
%PI MATLAB Class Library Version 1.1.1
% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

% only load dll if it wasn't loaded before
if(~libisloaded(c.libalias))
	c = LoadGCSDLL(c);
end
FunctionName = 'PI_ConnectUSBWithBaudRate';
if(any(strcmp(FunctionName,c.dllfunctions)))
	try
		[c.ID] = calllib(c.libalias,FunctionName,szHostName,nPort);
		if(c.ID<0)
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
