local matrix = {}

function matrix.setMatrixFront(text)
    IR.setText({
        font = "immersiverailroading:models/rolling_stock/locomotives/m8cb/fonts/32x14bold.png",
        color = "#FC8B23",
        fontSize = 32,
        textureWidth = 408,
        textureHeight = 199,
        fontGap = 1,
        ID = "ZielFront",
        resX = 216,
        resY = 32,
        flipped = false,
        fullbright = true,
        align = "center",
        text = text,
        global = true
    })
end

function matrix.setLinieFront(text)
    IR.setText({
        font = "immersiverailroading:models/rolling_stock/locomotives/m8cb/fonts/lnr.png",
        color = "#ffffff",
        fontSize = 84,
        textureWidth = 572,
        textureHeight = 84,
        fontGap = 1,
        ID = "LinieFront",
        resX = 429,
        resY = 84,
        flipped = true,
        fullbright = true,
        align = "left",
        text = text,
        global = true
    })
end

function matrix.getData(line, destination)
    print(linie)
    matrix.setMatrixFront(destination)
    matrix.setLinieFront(line)
end

function matrix.Steuerung(text)
    matrix.setMatrixFront(text)
end

return matrix