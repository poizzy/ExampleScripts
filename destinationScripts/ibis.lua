local ziele = require("ziele")
local textfields = require("textfields")
local matrix = require("matrix")

local ibis = {}

ibis.IBIS_timeout_time = 5000
ibis.IBIS_input = ""
ibis.IBIS_command = ""
ibis.IBIS_last_input_time = os.time()
ibis.IBIS_blink_counter = 0
ibis.IBIS_blink_duration = 20
ibis.IBIS_reset = false
ibis.selected_line = nil
ibis.selected_route = nil
ibis.selected_destination = nil
ibis.selection_mode = nil
ibis.current_stop_index = 1

function ibis.Reset()
    ibis.IBIS_input = ""
    ibis.IBIS_command = ""
    ibis.IBIS_blink_counter = 0
    ibis.selected_line = nil
    ibis.selected_route = nil
    ibis.selected_destination = nil
    ibis.selection_mode = nil
    ibis.current_stop_index = 1
end

function ibis.HandleNextStop()
    if ibis.selected_line and ibis.selected_route then
        local stop_count = ziele.getStopCount(ibis.selected_line, ibis.selected_route)

        if ibis.current_stop_index <= stop_count then
            local stop_name = ziele.getStop(ibis.selected_line, ibis.selected_route, ibis.current_stop_index)
            ibis.IBIS_command = stop_name
            ibis.current_stop_index = ibis.current_stop_index + 1
        else
            if ibis.selected_route == 1 then
                ibis.selected_route = 2
            else
                ibis.selected_route = 1
            end
            ibis.current_stop_index = 1

            ibis.selected_destination = ziele.getDestination(ibis.selected_line, ibis.selected_route)
            ibis.sendDataMatrix()
        end
    end

    ibis.UpdateTextFields()
end

function ibis.HandleTimeout()
    local current_time = os.time()
    if current_time - ibis.IBIS_last_input_time >= ibis.IBIS_timeout_time then
        ibis.Reset()
    end
end

function ibis.UpdateTextFields()
    textfields.setIBIS1(string.upper(ibis.IBIS_command))
    textfields.setIBIS2(ibis.IBIS_input)
end

function ibis.HandleLineSelection()
    ibis.selected_line = tonumber(string.sub(ibis.IBIS_input, 1, 3))
    ibis.selection_mode = nil

    if ibis.selected_line then
        ibis.IBIS_command = ""
    else
        ibis.IBIS_command = "Invalid Line Selection"
    end

    ibis.IBIS_input = ""
    ibis.UpdateTextFields()
    ibis.sendDataMatrix()
end

function ibis.HandleRouteSelection()
    local route_input = tonumber(ibis.IBIS_input)
    ibis.selected_route = route_input
    ibis.selection_mode = nil

    ibis.selected_destination = ziele.getDestination(ibis.selected_line, ibis.selected_route)
    ibis.IBIS_command = ibis.selected_destination

    ibis.UpdateTextFields()
    ibis.IBIS_input = ""
    ibis.current_stop_index = 1
    ibis.sendDataMatrix()
    ibis.HandleNextStop()
end

function ibis.HandleDestinationSelection()
    local destination_input = tonumber(ibis.IBIS_input)
    ibis.selection_mode = nil

    if destination_input then

        local destination_index = destination_input

        if ziele.getZiele(destination_index) then
            ibis.selected_destination = ziele.getZiele(destination_index)
            ibis.IBIS_command = ibis.selected_destination
        else
            ibis.IBIS_command = "Error"
        end
    else
        ibis.IBIS_command = "Error"
    end

    ibis.UpdateTextFields()

    ibis.IBIS_input = ""
    ibis.sendDataMatrix()
end

function ibis.KeyPress(key)
    if ibis.IBIS_reset then
        ibis.Reset()
        ibis.IBIS_reset = false
    end

    if key == "CLR" then
        ibis.Reset()
        return
    elseif key == "Eingabe" then
        if ibis.selection_mode == "line" then
            ibis.HandleLineSelection()
        elseif ibis.selection_mode == "route" then
            ibis.HandleRouteSelection()
        elseif ibis.selection_mode == "destination" then
            ibis.HandleDestinationSelection()
        end
        return
    elseif key == "Löschen" then
        ibis.IBIS_input = ""
        return
    end

    if ibis.selection_mode ~= nil then
        ibis.IBIS_input = ibis.IBIS_input .. key
    end

    if ibis.selection_mode ~= "linie" and ibis.selection_mode ~= "route" and ibis.selection_mode ~= "destination" then
        if key == "7" then
            ibis.IBIS_input = ""
            ibis.selection_mode = "line"
            ibis.IBIS_command = "Linie-Kurs:"
        elseif key == "8" then
            ibis.IBIS_input = ""
            ibis.selection_mode = "route"
            ibis.IBIS_command = "Route:"
        elseif key == "9" then
            ibis.IBIS_input = ""
            ibis.selection_mode = "destination"
            ibis.IBIS_command = "Ziel:"
        elseif key == "3" then
            ibis.HandleNextStop()
        end
    end

    ibis.IBIS_last_input_time = os.time()

    -- Reset if input exceeds appropriate length
    if (ibis.selection_mode == "line" and #ibis.IBIS_input > 5) or
            (ibis.selection_mode == "route" and #ibis.IBIS_input > 2) or
            (ibis.selection_mode == "destination" and #ibis.IBIS_input > 3) then
        ibis.IBIS_input = ""
    end

    ibis.UpdateTextFields()
end

function ibis.HandleButtonPresses()
    local button = nil

    if IR.getCG("1") == 1 then
        button = "1"
        IR.setCG("1", 0)
    elseif IR.getCG("2") == 1 then
        button = "2"
        IR.setCG("2", 0)
    elseif IR.getCG("3") == 1 then
        button = "3"
        IR.setCG("3", 0)
    elseif IR.getCG("4") == 1 then
        button = "4"
        IR.setCG("4", 0)
    elseif IR.getCG("5") == 1 then
        button = "5"
        IR.setCG("5", 0)
    elseif IR.getCG("6") == 1 then
        button = "6"
        IR.setCG("6", 0)
    elseif IR.getCG("7") == 1 then
        button = "7"
        IR.setCG("7", 0)
    elseif IR.getCG("8") == 1 then
        button = "8"
        IR.setCG("8", 0)
    elseif IR.getCG("9") == 1 then
        button = "9"
        IR.setCG("9", 0)
    elseif IR.getCG("0") == 1 then
        button = "0"
        IR.setCG("0", 0)
    elseif IR.getCG("10") == 1 then
        button = "Eingabe"
        IR.setCG("10", 0)
    elseif IR.getCG("11") == 1 then
        button = "Löschen"
        IR.setCG("11", 0)
    end

    if button then
        print(button)
        ibis.KeyPress(button)
    end
end

function ibis.IBIS_Update()
    ibis.HandleButtonPresses()

    ibis.HandleTimeout()
end

function ibis.sendDataMatrix()
    local line = ""
    local destination = ""

    if ibis.selected_destination then
        destination = ibis.selected_destination
    end

    if ibis.selected_line then
        line = ibis.selected_line
    end

    matrix.getData(line, destination)
end

function ibis.sendDataInnenanzeige()
    return
end

return ibis
