local ziele = {}

local zieleStadtbahn = {
    [1] = "Senne",
    [2] = "Schildesche",
    [3] = "Brackwede Bf.",
    [4] = "Kattenkamp",
    [5] = "Adenauerplatz",
    [6] = "Altenhagen",
    [7] = "Sieker",
    [8] = "Milse",
    [9] = "Beckhausstraße",
    [10] = "Schüco",
    [11] = "Babenhausen Süd",
    [12] = "Dürkopp Tor 6",
    [13] = "Stieghorst",
    [14] = "Sieker Mitte",
    [15] = "Theesen",
    [16] = "Lohmannshof",
    [17] = "Universität",
    [18] = "Hauptbahnhof",
    [19] = "Rathaus",
    [20] = "Oetkerhalle",
    [21] = "Landgericht",
    [22] = "Obernstraße",
    [23] = "Sonderfahrt",
    [101] = "Test",
    [999] = "Hauptbahnhof"
}

local stadtbahn_bielefeld = {
    [1] = {
        [1] = {
            destination = zieleStadtbahn[1],
            stops = {
                "Schildesche",
                "Heidegärten",
                "Kattenkamp",
                "Deciusstraße",
                "Johannesstift",
                "Sudbrackstraße",
                "Hauptbahnhof",
                "Jahnplatz",
                "Rathaus",
                "Landgericht",
                "Adenauerplatz",
                "Bethel",
                "Friedrich-List-Straße",
                "Eggeweg",
                "Brackwede Bahnhof",
                "Gaswerkstraße",
                "Normannenstraße",
                "Brackwede Kirche",
                "Windelsbleicher Straße",
                "Rosenhöhe",
                "Sennefriedhof",
                "Senne"
            }
        },
        [2] = {
            destination = zieleStadtbahn[2],
            stops = {
                "Senne",
                "Sennefriedhof",
                "Rosenhöhe",
                "Windelsbleicher Straße",
                "Brackwede Kirche",
                "Normannenstraße",
                "Gaswerkstraße",
                "Brackwede Bahnhof",
                "Eggeweg",
                "Friedrich-List-Straße",
                "Bethel",
                "Adenauerplatz",
                "Landgericht",
                "Rathaus",
                "Jahnplatz",
                "Hauptbahnhof",
                "Sudbrackstraße",
                "Johannesstift",
                "Deciusstraße",
                "Kattenkamp",
                "Heidegärten",
                "Schildesche"
            }
        }
    },
    [2] = {
        [1] = {
            destination = zieleStadtbahn[6],
            stops = {
                "Sieker",
                "Prießallee",
                "Mozartstraße/Synagoge",
                "Teutoburger Straße",
                "August-Bebel-Straße",
                "Landgericht",
                "Rathaus",
                "Jahnplatz",
                "Hauptbahnhof",
                "Beckhausstraße",
                "Stadtheider Straße",
                "Schillerstraße",
                "Finkenstraße",
                "Ziegelstraße",
                "Schüco",
                "Seidenstickerstraße",
                "Baumheide",
                "Schelpmilser Weg",
                "Milse",
                "Buschbachtal",
                "Altenhagen"
            }
        },
        [2] = {
            destination = zieleStadtbahn[7],
            stops = {
                "Altenhagen",
                "Buschbachtal",
                "Milse",
                "Schelpmilser Weg",
                "Baumheide",
                "Seidenstickerstraße",
                "Schüco",
                "Ziegelstraße",
                "Finkenstraße",
                "Schillerstraße",
                "Stadtheider Straße",
                "Beckhausstraße",
                "Hauptbahnhof",
                "Jahnplatz",
                "Rathaus",
                "Landgericht",
                "August-Bebel-Straße",
                "Teutoburger Straße",
                "Mozartstraße/Synagoge",
                "Prießallee",
                "Sieker"
            }
        }
    },
    [3] = {
        [1] = {
            destination = zieleStadtbahn[11],
            stops = {
                "Dürkopp Tor 6",
                "Rathaus",
                "Jahnplatz",
                "Hauptbahnhof",
                "Wittekindstraße",
                "Nordpark",
                "Auf der Hufe",
                "Lange Straße",
                "Koblenzer Straße",
                "Voltmannstraße",
                "Babenhausen Süd"
            }
        },
        [2] = {
            destination = zieleStadtbahn[12],
            stops = {
                "Babenhausen Süd",
                "Voltmannstraße",
                "Koblenzer Straße",
                "Lange Straße",
                "Auf der Hufe",
                "Nordpark",
                "Wittekindstraße",
                "Hauptbahnhof",
                "Jahnplatz",
                "Rathaus",
                "Dürkopp Tor 6"
            }
        }
    },
    [4] = {
        [1] = {
            destination = zieleStadtbahn[16],
            stops = {
                "Stieghorst",
                "Stieghorst Gesamtschule",
                "Elpke",
                "Roggenkamp",
                "Luther-Kirche",
                "Sieker Mitte",
                "Oststraße",
                "Krankenhaus Mitte",
                "Marktstraße",
                "Rathaus",
                "Jahnplatz",
                "Hauptbahnhof",
                "Siegfriedplatz",
                "Rudolf-Oetker-Halle",
                "Graf-von-Stauffenberg-Straße",
                "Bültmannshof",
                "Universität",
                "Wellensiek",
                "Lohmannshof"
            }
        },
        [2] = {
            destination = zieleStadtbahn[13],
            stops = {
                "Lohmannshof",
                "Wellensiek",
                "Universität",
                "Bültmannshof",
                "Graf-von-Stauffenberg-Straße",
                "Rudolf-Oetker-Halle",
                "Siegfriedplatz",
                "Hauptbahnhof",
                "Jahnplatz",
                "Rathaus",
                "Marktstraße",
                "Krankenhaus Mitte",
                "Oststraße",
                "Sieker Mitte",
                "Luther-Kirche",
                "Roggenkamp",
                "Elpke",
                "Stieghorst Gesamtschule",
                "Stieghorst"
            }
        }
    },
    [5] = {
        [5] = {
            destination = zieleStadtbahn[21],
            stops = {
                "Landgericht", "Obernstraße"
            }
        }
    },
    [6] = {
        [1] = {
            destination = zieleStadtbahn[23],
            stops = {
                "Not Enterable"
            }
        }
    }
}

function ziele.getDestination(line, route)
    if not stadtbahn_bielefeld[line] or not stadtbahn_bielefeld[line][route] then
        return "Invalid line or route"
    end
    return stadtbahn_bielefeld[line][route].destination
end


function ziele.getZiele(index)
    if not zieleStadtbahn[index] then
        return "Invalid destination index: " .. tostring(index)
    end
    return zieleStadtbahn[index]
end


function ziele.getStopCount(line, route)
    if not stadtbahn_bielefeld[line] or not stadtbahn_bielefeld[line][route] then
        return 0
    end
    local stops = stadtbahn_bielefeld[line][route].stops
    return #stops
end


function ziele.getStop(line, route, stopIndex)
    local stops = stadtbahn_bielefeld[line][route].stops
    if stopIndex < 1 or stopIndex > #stops then
        return "Invalid stop index: " .. tostring(stopIndex)
    end
    return stops[stopIndex]
end


return ziele