--[[----------------------------------------------------------------------------

DlgDevelopPresets.lua

Manages options for plugin
 
This file is part of MIDI2LR. Copyright 2015-2016 by Rory Jaffe.

MIDI2LR is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later version.

MIDI2LR is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
MIDI2LR.  If not, see <http://www.gnu.org/licenses/>. 
------------------------------------------------------------------------------]]

local Presets           = require 'Presets'
local LrBinding         = import 'LrBinding'
local LrDialogs         = import 'LrDialogs'
local LrFunctionContext = import 'LrFunctionContext'
local LrView            = import 'LrView'

local function setOptions()
  LrFunctionContext.callWithContext( "assignPresets", function( context )
      local f = LrView.osFactory()
      local properties = LrBinding.makePropertyTable( context )
      -- assemble dialog box contents
      local contents = {
        title = LOC("$$$/SmartCollection/Criteria/DevelopPreset=Develop Preset"),
        f:view(Presets.StartDialog(properties,f)),
      }
      -- display dialog
      local result = LrDialogs.presentModalDialog {
        title = LOC("$$$/SmartCollection/Criteria/DevelopPreset=Develop Preset"),
        contents = contents,
      }

      Presets.EndDialog(properties,result)
      if result == 'ok' then
        --then save preferences
        Preferences.Save()
      end -- if result ok
      -- finished with assigning values from dialog
    end
  )
end
setOptions() --execute
