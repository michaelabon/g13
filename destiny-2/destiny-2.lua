function OnEvent(event, arg)
  OutputLogMessage("event = %s,\narg = %s\n", event, arg)

  if event == "G_PRESSED" then
    if arg == AUTO_SPRINT then
      handleAutoSprint();
    elseif arg == WALK_FORWARD then
      handleWalkForward();
    elseif arg == JUMP then
      allowJump();
    else
      stopRunning();
    end
  end
end

AUTO_SPRINT = 7;
WALK_FORWARD = 4;
JUMP = 23;

function handleAutoSprint()
  if not amCurrentlyRunning then
    PressKey("lshift");
    PressKey("w");
    amCurrentlyRunning = true;
  else
    ReleaseKey("lshift");
    ReleaseKey("w");
    amCurrentlyRunning = false;
  end
end

function handleWalkForward()
  if amCurrentlyRunning then
    ReleaseKey("lshift");
    amCurrentlyRunning = false;
  end
end

function allowJump()
  -- pass
end

function stopRunning()
  if amCurrentlyRunning then
    ReleaseKey("lshift");
    ReleaseKey("w");
    amCurrentlyRunning = false;
  end
end
