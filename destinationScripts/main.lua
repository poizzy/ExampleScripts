local ibis = require("ibis")

function tickEvent()
    ibis.IBIS_Update()
    IR.setCG("test", 1)
end