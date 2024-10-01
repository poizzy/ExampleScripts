local textfields = {}

function textfields.setIBIS1(text)
    IR.setText({
        font = "immersiverailroading:models/rolling_stock/locomotives/m8cb/fonts/ibis.png",
        color = "#000000",
        fontSize = 21,
        textureWidth = 128,
        textureHeight = 128,
        fontGap = 1,
        ID = "IBIS1",
        resX = 1900,
        resY = 21,
        flipped = false,
        fullbright = true,
        align = "left",
        text = text
    })
end

function textfields.setIBIS2(text)
    IR.setText({
        font = "immersiverailroading:models/rolling_stock/locomotives/m8cb/fonts/ibis.png",
        color = "#000000",
        fontSize = 21,
        textureWidth = 128,
        textureHeight = 128,
        fontGap = 1,
        ID = "IBIS2",
        resX = 1900,
        resY = 21,
        flipped = false,
        fullbright = true,
        align = "right",
        text = text
    })
end

return textfields