function [bJoystickButtons] = qATS(c,iJoystickIDs,iJoystickAxesIDs)
%function [bJoystickButtons] = qATS(c,iJoystickIDs,iJoystickAxesIDs)
%PI MATLAB Class Library Version 1.1.1
% This code is provided by Physik Instrumente(PI) GmbH&Co.KG.
% You may alter it corresponding to your needs.
% Comments and Corrections are very welcome.
% Please contact us by mailing to support-software@pi.ws. Thank you.

if(c.ID<0), error('The controller is not connected'),end;
FunctionName = 'PI_qATS';
if(any(strcmp(FunctionName,c.dllfunctions)))
	nValues = length(iJoystickIDs);
	bJoystickButtons = zeros(size(iJoystickIDs));
	piJoystickIDs = libpointer('int32Ptr',iJoystickIDs);
	piJoystickAxesIDs = libpointer('int32Ptr',iJoystickAxesIDs);
	pbJoystickButtons = libpointer('int32Ptr',bJoystickButtons);
	try
		[bRet,iJoystickIDs,iJoystickAxesIDs,bJoystickButtons] = calllib(c.libalias,FunctionName,c.ID,piJoystickIDs,piJoystickAxesIDs,pbJoystickButtons,nValues);
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
