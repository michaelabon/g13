function OnEvent(event, arg)
  OutputLogMessage("event = %s, arg = %s\n", event, arg)

  HandleZoneLayer(event, arg)
  HandleSpeed(event, arg)
end

-- Use G15 as a layer-enabling key. It chords via the table below.
function HandleZoneLayer(event, arg)
  local ZONE_LAYER_KEY=15
  local RESIDENTIAL_LO="4"
  local RESIDENTIAL_HI="5"
  local COMMERCIAL_LO="6"
  local COMMERCIAL_HI="7"
  local INDUSTRIAL="8"
  local OFFICE="9"
  local DEZONE="0"

  if event == "G_PRESSED" and arg == ZONE_LAYER_KEY then
    zone_layer_enabled = true
  end

  if event == "G_RELEASED" and arg == ZONE_LAYER_KEY then
    zone_layer_enabled = false
  end

  if event == "G_PRESSED" and zone_layer_enabled then
    if arg == 3 then
      PressAndReleaseKey(RESIDENTIAL_LO)
    elseif arg == 4 then
      PressAndReleaseKey(COMMERCIAL_LO)
    elseif arg == 5 then
      PressAndReleaseKey(INDUSTRIAL)
    elseif arg == 10 then
      PressAndReleaseKey(RESIDENTIAL_HI)
    elseif arg == 11 then
      PressAndReleaseKey(COMMERCIAL_HI)
    elseif arg == 12 then
      PressAndReleaseKey(OFFICE)
    elseif arg == 17 then
      PressAndReleaseKey(DEZONE)
    end
  end
end

SPEED_KEYS={"1", "3"}
SPEED_INDEX=1

-- Toggle the simulation between normal speed and super fast speed
-- G23 is the thumb button to the left of the joystick.
function HandleSpeed(event, arg)
  local TOGGLE_SPEED=23

  if event == "G_PRESSED" and arg == TOGGLE_SPEED then
    PressAndReleaseKey(SPEED_KEYS[SPEED_INDEX])
    SPEED_INDEX = SPEED_INDEX + 1
    if SPEED_INDEX > #SPEED_KEYS then
      SPEED_INDEX = 1
    end
  end
end
